require_relative 'text/node'
require_relative 'text/inline/character'
require_relative 'text/block'
require_relative 'text/document'

###
# This _abstract_ class can take a text `Document` and traverse its nodes. This
# is the base for the `Lexer` class.
###
module Byron
  class Traverser

    def prepare(document)
      @document = document
      @node = document ? document.body : nil
    end

    def important?
      true
    end

    ##
    # Move to a particular node in the document.
    ##
    def move_to(node)
      old, @node = @node, node
      old
    end

    ##
    # Move to next node.
    ##
    def move
      move_to @node.next
    end

    ##
    # Try to consume a node of given `type`.
    ##
    def get_node(type = Text::Node)
      if @node.include? type
        move

      raise "Cannot get node of type #{type}"
    end

    ##
    # Try to consume a node of given `type` or return `nil`.
    ##
    def eat_node(type = Text::NODE)
      start
        node = get_node type
    end

    ##
    # Returns `true` if current node starts a block. This can also tell if last
    # read node ended a block by calling.
    ##
    def start_of_block?(node = @node)
    end

    ##
    # Returns `true` if current node *ends* a block, ie: there are no further
    # elements after `current` until current block is closed.
    ##
    def end_of_block?(node = @node)
    end

    ##
    # Return `true` if the end of the document has been reached.
    ##
    def end_of_text?
      not @node
    end

    ##
    # Ascend current node ancestors until a node of `type` is found.
    ##
    def ascend(type = Text::NODE)
    end

    ##
    # Move to a `type` descendant of current node.
    ##
    def descend
    end

    def skip_whitespace
    end

    ##
    # Consume an inline node of given `type`. If current node is a block one,
    # then descend down to an inline node.
    ##
    def get_inline_node(type = Text::Inline, ignore_whitespace = false)
    end

    ##
    # Consume an atomic node of given `type`. If current node is not of `Atomic`
    # class, then descend down to an atomic node. If first `Atomic` node is not
    # of given `type`, an exception is thrown
    ##
    def get_atomic_node(type = Text::Atomic, ignore_whitespace = false)

  end
end
