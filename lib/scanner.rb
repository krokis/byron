###
# Todo:
# - Code blocks children should be an array of *lines* or something.
# - Ordered lists.
# - Important nodes inside code blocks coments. Extensions should provide
#   this.
# - Important blocks
# - String blocks?

#   """
#   Long
#   text here with quotes and stuff
#   Indentation is ignored
#   """

# - Non-fenced (indented) code blocks.
# - Citations, foot references and notes, etc.
# - Sections; matching with headings.
# - Tables?
# - Literals
# - The scanner should be extensible with new node classes!!
# - All the other TODOs
###
#

require 'yaml'

# Require all known nodes
require_relative 'text/node'
require_relative 'text/inline'
require_relative 'text/inline/emphasis'
require_relative 'text/inline/important'
require_relative 'text/inline/link'
require_relative 'text/inline/atomic/whitespace'
require_relative 'text/inline/atomic/character'
require_relative 'text/inline/atomic/literal'
require_relative 'text/inline/atomic/literal/code'
require_relative 'text/inline/atomic/literal/number'
require_relative 'text/inline/atomic/literal/string'
require_relative 'text/block'
require_relative 'text/block/code'
require_relative 'text/block/heading'
require_relative 'text/block/list'
require_relative 'text/block/list/unordered'
require_relative 'text/block/list/ordered'
require_relative 'text/block/list_item'
require_relative 'text/block/paragraph'
require_relative 'text/block/quotation'
require_relative 'text/block/section'
require_relative 'text/document'

module Byron

  ##
  #
  ##
  class Scanner

    ##
    #
    ##
    def initialize
      prepare
    end

    ##
    # Prepare state.

    def prepare(text = '')
      @text = text
      @position = 0
      @line = 0
      @column = 0
      @section = nil
      @length = @text.length
      @indentation = []
    end

    ##
    # Add a level of indentation.
    ##
    def indent(ind)
      @indentation << ind
    end

    ##
    # Remove last level of indentation.
    ##
    def unindent
      @indentation.pop
    end

    def location
    end

    ##
    # Move to given `position`.
    ##
    def move_to (position)
      unless position >= 0 && position <= @length
        raise "Cannot move to position #{position}"
      end

      until @position == position do

        if position < @position

          if @text[@position - 1] == "\n"
            @column = 0
            c = @position - 1

            while c > 0 && @text[c] != "\n" do
              @column += 1
              c -= 1
            end

            @line -= 1
          else
            @column -= 1
          end

          @position -= 1

        else

          if @text[@position] == "\n"
            @column = 0
            @line += 1
          else
            @column += 1
          end

          @position += 1
        end

      end

      if @position < (@length - 1)
        return @text[@position]
      end
    end

    ##
    # Move `n` characters starting from current position.
    #
    # The `n` number can be possitive to move forward, negative to move
    # backwards or zero not to move at all. Defaults to `1`, which means
    # `@move()` advances one single position.
    ##
    def move(n = 1)
      move_to(@position + n)
    end

    ##
    # Return `yes` if the end of text has been reached; ie: current position is
    # the same as the text length.
    ##
    def end_of_text?
      @position >= @length
    end


    ##
    # Return `yes` if current position is the last on line; ie: if next
    # character is a line break or the end of the text.
    ##
    def end_of_block?
      return false unless end_of_line?

      unless end_of_text?
        nxt = next_line

        if nxt.trim != ''
          indent = @indentation
          i = indent.length

          if nxt[0, i] == indent
            return false
          end
        end

        return true
      end

    end

    ##
    #
    ##
    def make_node(kind)
    end

    ##
    # Return the character at given `position`.
    ##
    def char_at(position = @position)
      if position >= 0 && position < @length
        @text[position]
      else
        null
      end
    end

    ##
    # Returns a portion of the text, starting from `position` and inlinening
    # through `length` characters or until the end of text is found, whatever
    # comes first.
    def chars(length = 1, position = @position)
      position = [position, @length].min
      length = [length, @length - position].min
      @text[position, length]
    end

    ##
    # Returns next `n` characters, starting from current position, without
    # changing current position.
    #
    # With default `n` being `1`, this function retrieves the very next
    # character starting from current position.
    ##
    def next(n = 1)
      chars(n, @position + 1)
    end

    ##
    # Move to the begining of the next line. If EOT is found before a line
    # break, an exception is raised.
    ##
    def move_to_next_line
      loop do
        if @char == "\n"
          move
          break
        elsif @char.nil?
          raise 'Cannot move to next line: EOT found'
        end
      end
    end

    ##
    #
    ##
    def current_line
      eol = @text.index "\n", @position
      eol = @length -1 if eol.nil?
      chars((eol - @position), @position - @column)
    end

    ##
    # Peek next line.
    ##
    def next_line
    end

    ##
    # If __at the beginning__ of a line, skip any consequtive empty (whitespace
    # only) lines, including current one and move to the start of the first
    # non-whitespace line.
    ##
    def skip_empty_lines
    end

    ##
    # Move forward until the current character is not one of the passed `chars`.
    ##
    def skip_chars(chars = '')
    end

    ##
    # Move forward until current character is one of the passed `chars` or end
    # of text is reached.
    ##
    def skip_chars_until(chars)
    end

    ##
    # Move forward until current character is one of the passed `chars` or end
    # of block is reached.
    ##
    def skip_inline_chars_until(chars)
    end

    ##
    # Skip any horizontal spacing.
    ##
    def skip_spaces
      skip_chars " \t"
    end

    ##
    # Read an atx-style heading.
    ##
    def read_atx_heading
    end

    ##
    # Read a "setext" heading.
    ##
    def read_setext_heading
    end

    ##
    # Read an "atx" or "setext" heading.
    ##
    def read_heading
      read_atx_heading ||
      read_setext_heading
    end

    ##
    #
    ##
    def read_character
    end

    def read_code_line
    end

    ##
    # Read an indented `CodeBlock`.
    ##
    def read_indented_code_block
    end

    ##
    # Read a _fenced_ `CodeBlock`.
    ##
    def read_fenced_code_block
    end

    ##
    # Read a `CodeBlock`.
    ##
    def read_code_block
      read_fenced_code_block ||
      read_indented_code_block
    end

    ##
    # Read an `Emphasis` (_lorem_) or `MoreEmphasis` (__ipsum__) node.
    ##
    def read_emphasis
    end

    ##
    # Read a `StringLiteral` node.
    ##
    def read_string_literal
    end

    ##
    # Read a `NumberLiteral` node.
    ##
    def read_number_literal
    end

    ##
    # Read an inline `Code` node.
    ##
    def read_code_literal
    end

    def read_literal
      read_code_literal ||
      read_string_literal ||
      read_number_literal
    end

    ##
    # Read a link node.
    ##
    def read_link
    end

    ##
    # Read an inline *important* node.
    ##
    def read_important
    end

    ##
    # Read a `Whitespace` node with one or more consecutive whitespace
    # characters (spaces, tabs or line breaks).
    ##
    def read_whitespace
    end

    ##
    # Read an `Inline` node unless current character is at the end of the block.
    ##
    def read_inline
      unless is_end_of_block?
        read_emphasis ||
        read_important ||
        read_link ||
        read_literal ||
        read_whitespace ||
        read_character
      end
    end

    ##
    # Read a `Paragraph` node.
    ##
    def read_paragraph
    end

    ##
    # Read an ordered list.
    ##
    def read_ordered_list
    end

    ##
    # Read an unordered list.
    ##
    def read_ordered_list
    end

    ##
    # Read a `List` node, either an `UnorderedList` or an `OrderedList`.
    ##
    def read_list
    end

    ##
    #
    ##
    def read_quotation_block
    end

    def skip_indentation
    end

    def read_break
    end

    ##
    # Read a `Block` level node.
    ##
    def read_block
      read_heading ||
      read_quotation_block ||
      read_list ||
      read_code_block ||
      read_break ||
      read_paragraph
    end

    ##
    # Read one or more equally-indented block nodes. White lines around blocks
    # are ignored.
    ##
    def read_blocks
    end

    ##
    # Start a `Section` node and read its contents.
    ##
    def read_section
    end

    ##
    # Read meta data from document YAML front matter.
    ##
    def read_meta
      {}
    end

    ##
    # Read the document itself.
    ##
    def read_document
      document = Document.new
      document.meta = read_meta
      document.body = read_section

      document
    end

    ##
    # Scans a text.
    #
    # This method will scan the passed `text` and return, when successfully, a
    # `Document` instance containing the structure of the text.
    ##
    def scan(text)
      prepare text
      read_document
    end

  end # class Scanner

end # module Byron
