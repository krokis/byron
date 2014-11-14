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
      old, @node = @node, node
      old
    end

    ##
    # Move to next node.
    #
    def move
      move_to @node.next
    end

    ##
    # Try to consume a node of given `type`.
    #
    def get_node (type = Text::Node)
      unless @node.kind_of? type
        raise "Cannot get node of type #{type}"
      end

      move
    end

    ##
    # Try to consume a node of given `type` or return `nil`.
    #
    def eat_node (type = Text::NODE)
      begin
        get_node type
      end
    end

    ##
    # Returns `true` if current node starts a block. This can also tell if last
    # read node ended a block by calling.
    #
    def start_of_block? (node = @node)
      !@node || !@node.parent || @node.first_child?
    end

    ##
    # Returns `true` if current node *ends* a block, ie: there are no further
    # elements after `current` until current block is closed.
    #
    def end_of_block? (node = @node)
      return true if end_of_text? || !node || !node.parent
    end

    ##
    # Return `true` if the end of the document has been reached.
    #
    def end_of_text?
      !@node
    end

    ##
    # Ascend current node ancestors until a node of `type` is found.
    #
    def ascend (type = Text::Node)
      if ancestor = (@node.ancestor type)
        move_to ancestor
      else
        raise 'Cannot ascend'
      end
    end

    ##
    # Move to a `type` descendant of current node.
    #
    def descend (type = Text::Node)
      unless end_of_text?
        if descendant = (@node.descendant type)
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
      while (eat Text::Whitespace) do; end
      @node
    end
    ##
    #
        # Consume an inline node of given `type`. If current node is a block one,
    # then descend down to an inline node.
    ##
    def get_inline_node (type = Text::Inline, ignore_whitespace = false)
      descend Text::Inline
      skip_whitespace if ignore_whitespace
      get_node type
    end

    ##
    # Consume an atomic node of given `type`. If current node is not of `Atomic`
    # class, then descend down to an atomic node. If first `Atomic` node is not
    # of given `type`, an exception is thrown
    ##
    def get_atomic_node (type = Text::Atomic, ignore_whitespace = false)
      descend Text::Atomic
      skip_whitespace if ignore_whitespace
      get_node type
    end

  end
  #
  ## class Traverser

end
