require_relative 'text/node'
require_relative 'text/inline/character'
require_relative 'text/block'
require_relative 'text/document'

class Byron

  ##
  # This is the base for the `Lexer` class, to which provides methods to
  # traverse a text `Document`.
  #
  class Traverser

    attr_reader :node

    ##
    #
    #
    def prepare (document)
      @document = document
      @node = document ? document.body : nil
    end

    ##
    # Move to a particular node in the document.
    #
    def move_to (node)
      # Should check `!node || node.document == @node.document`
      old, @node = @node, node
      @node
    end

    ##
    # Move to next node in document.
    #
    def move
      move_to @node.next
    end

    ##
    # Try to consume a node of given `kind`.
    #
    def get_node (kind = Text::Node)
      if @node.kind_of? kind
        node = @node
        move
        node
      end
    end

    ##
    # Returns `true` if current node starts a block. This can also tell if last
    # read node ended a block???.
    #
    def start_of_block?
      !@node || !@node.parent || @node.first_child?
    end

    ##
    # Returns `true` if current node *ends* a block, ie: there are no further
    # elements after `current` until current block is closed.
    #
    def end_of_block?
      (end_of_text? || !@node || !@node.parent) || false
    end

    ##
    # Return `true` if the end of the document has been reached.
    #
    def end_of_text?
      !@node
    end

    ##
    # Ascend current node ancestors until a node of given `kind` is found.
    #
    def ascend (kind = Text::Node)
      if ancestor = (@node.ancestor kind)
        move_to ancestor
      else
        raise 'Cannot ascend'
      end
    end

    ##
    # Move to a `kind` descendant of current node.
    #
    def descend (kind = Text::Node)
      unless end_of_text?
        if descendant = (@node.descendant kind)
          move_to descendant
        else
          raise 'Cannot descend'
        end
      end
    end

    ##
    #
    #
    def skip_whitespace
      while (get_node Text::Whitespace) do; end
    end

    ##
    # Consume an inline node of given `kind`. If current node is a block one,
    # then descend down to an inline node.
    #
    def get_inline_node (kind = Text::Inline, ignore_whitespace = false)
      start = @node

      begin
        descend Text::Inline
        skip_whitespace if ignore_whitespace
        if node = (get_node kind)
          return node
        end
      rescue
      end

      move_to start
      nil
    end

    ##
    # Consume an atomic node of given `kind`. If current node is not of `Atomic`
    # class, then descend down to an atomic node. If first `Atomic` node is not
    # of given `kind`, an exception is thrown
    #
    def get_atomic_node (kind = Text::Atomic, ignore_whitespace = false)
      start = @node
      begin
        descend Text::Atomic
        skip_whitespace if ignore_whitespace
        if node = (get_node kind)
          return node
        end
      rescue
      end

      move_to start
      nil
    end

  end
  #
  ##

end
