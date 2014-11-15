class Byron
  module Text

    ##
    #
    #
    class Node

      ##
      # Returns a reference to node's parent, if any.
      #
      attr_accessor :parent

      ##
      # Start position.
      #
      attr_accessor :start

      ##
      # End position.
      #
      attr_accessor :stop

      ##
      # Array of children of this node. Might be empty.
      #
      attr_accessor :children

      ##
      # Tells if this node has any children.
      #
      def children?
        @children && !@children.empty?
      end

      ##
      # Reference to the document this node belongs to. Note this getter will
      # return its node's parent document, if it has one, even though if this
      # property has been set before. Ie: you can only set the `document` of a
      # node if it has no `parent`.
      #
      def document
        @parent ? @parent.document : @document
      end

      ##
      # Set document of node.
      #
      def document= (doc)
        if @parent
          raise 'Cannot set `parent` of a non-root node'
        end
        @document = doc
      end

      ##
      # Holds node contents as a string.
      #
      def content
        str = ''
        @children.each do |child|
          str << child.content
        end

        str.length > 0 ? str : nil
      end

      ##
      #
      #
      def initialize
        @children = []
        @document = nil
      end

      ##
      # Check if another node can be added as a child of this node.
      #
      def can_append_child? (child)
        raise 'Oops' # TODO
      end

      ##
      # Add one child to this node.
      #
      def append_child (child)
        if can_append_child? child
          @children << child
          child.parent = self
        else
          raise "Cannot append #{child} to #{self}"
        end
      end

      ##
      # Add one or more children to this node.
      #
      def append (*children)
        children.map { |child| append_child child }
        self
      end

      ##
      #
      def index(child)
        @children.index child
      end


      ##
      # Returns `true` if the node has a parent and it's the only child or the
      # first among its siblings
      #
      def first_child?
        @parent && (@parent.index self) == 0
      end

      ##
      # Returns `true` if the node has a parent and it's the only child or the
      # last among its siblings
      #
      def last_child?
        @parent && ((@parent.index self) == (@parent.children.length - 1))
      end

      ##
      # Returns next node.
      #
      def next
        node = self

        while node.parent
          unless node.last_child?
            return node.parent.children[(node.parent.children.rindex self) + 1]
          end
          node = node.parent
        end

        nil # Needed? :S
      end

      ##
      # Returns previous node.
      #
      def previous
        node = self

        while node.parent
          unless node.is_first_child
            return node.parent.children[(node.parent.children.index self) - 1]
          end
        end || nil
      end

      ##
      # Search for a node of type `kind`, starting from the reference `node` and
      # then going upwards to its ancestors.
      #
      # The first node (including `this` if `itself` is `yes`) that is found to
      # be an instance of `kind` is returned. If no suitable node is found, then
      # `null` is returned.
      #
      def ancestor (kind, itself = true)
        node = itself ? self : @parent

        while node
          return node if (node.kind_of? kind)
          node = node.parent
        end || nil
      end

      ##
      # Search for a node of type `kind`, starting from the `reference` node and
      # then digging into its descendants, like this:
      #     - reference
      #     - reference.children[0]
      #     - reference.children[0].children[0]
      #     - reference.children[0].children[0].children[0]
      #        ...
      #     - reference.children[1]
      #     - reference.children[1].children[0]
      #
      # And so.
      #
      # The first node (including `this` if `itself` is `yes`) that is found to
      # be an instance of `kind` is returned. If no suitable node is found, then
      # `null` is returned.
      #
      def descendant(kind = Node, itself = true)
        if itself && (self.kind_of? kind)
          return self
        end

        for child in @children
          if node = (child.descendant kind)
            return node
          end
        end

        nil # Needed? :S
      end

      ##
      # Get a string representation of this node.
      #
      def to_s
        @content
      end

      ##
      # Get a JSON representation of this node.
      #
      def to_json
      end

    end
    #
    ##

  end
end
