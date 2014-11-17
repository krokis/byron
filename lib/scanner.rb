##
# Todo:
# - Code blocks children should be an array of *lines* or something.
# - Setext headings.
# - Quotation blocks.
# - Links.
# - Breaks.
# - YAML front-matter.
# - Ordered lists.
# - Important nodes inside code blocks coments. Extensions should somehow parse
#   their contents.
# - Important blocks:
#
#      ***
#      Everything here is considered important.
#
#      This is important too.
#      ***
#
#      But this isn't.
#
#   This allows us to create documents in which everything is important
#   (closing `***` might be omitted).
#
# - String blocks?
#
#       """
#       Long
#       text here with quotes and stuff.
#       Indentation should be ignored. (????)
#       """
#
# - Non-fenced (indented) code blocks.
# - Citations, foot references and notes, etc.
# - Sections; matching with headings.
# - Tables?
# - Literals
# - All the other TODOs
##

# Std-lib
require 'yaml'

##
# All known nodes
#
require_relative 'text/inline/emphasis'
require_relative 'text/inline/important'
require_relative 'text/inline/link'
require_relative 'text/inline/character'
require_relative 'text/inline/literal/code'
require_relative 'text/inline/literal/number'
require_relative 'text/inline/literal/string'
require_relative 'text/block/break'
require_relative 'text/block/code'
require_relative 'text/block/heading'
require_relative 'text/block/list/unordered'
require_relative 'text/block/list/ordered'
require_relative 'text/block/list_item'
require_relative 'text/block/paragraph'
require_relative 'text/block/quotation'
require_relative 'text/block/section'
require_relative 'text/document'

class Byron

  ###
  # The Scanner class.
  #
  # Instances of this class take a Markdown-like text, analyze its structure and
  # return a `Document` representation of it which can be passed later to a
  # `Parser` to get a syntax tree.
  #
  class Scanner

    ##
    # (0-based) index of current character being scanned. When this index is
    # equal to the length of text, it means the end of text has been reached.
    #
    attr_reader :position

    ##
    # Constructor...
    #
    def initialize
      prepare
    end

    ##
    # Prepare state.
    #
    def prepare (text = '')
      @text = text
      @length = @text.length
      @section = nil
      @indentation = []
      move_to 0 # This sets `@char` to `@text[0]` or `nil`
    end

    ##
    # Add a level of indentation.
    #
    def indent (ind)
      @indentation << ind
    end

    ##
    # Remove last level of indentation.
    #
    def unindent
      @indentation.pop
    end

    ##
    # Get current indentation as a string
    #
    def indentation
      @indentation.join ''
    end

    ##
    # Move to given `position`.
    #
    def move_to (position)
      unless position.between? 0, @length
        raise "Cannot move to position #{position}"
      end

      @char = @text[@position = position]
    end

    ##
    # Move `n` characters starting from current position.
    #
    # The `n` number can be positive to move forward, negative to move
    # backwards or zero to not move at all. Defaults to `1`, which means `#move`
    # advances one single position.
    #
    def move (n = 1)
      move_to(@position + n)
    end

    ##
    # Return `true` if the end of text has been reached; ie: current position is
    # the same as the text length.
    #
    def end_of_text?
      @position >= @length
    end

    ##
    # Return `true` if at the beginning of the document.
    #
    def start_of_text?
      @position == 0
    end

    ###
    # Return `true` if current position is the last on line; ie: if next
    # character is a line break or the end of the text.
    #
    def end_of_line?
      end_of_text? || @char == '\n'
    end

    ##
    # Returns `true` if current position is at the end of a block, ie: it's at
    # the end of the line and next non-empty line has a different indentation.
    #
    def end_of_block?
      if end_of_line?
        unless end_of_text?
          line = next_line

          unless line.strip.empty?
            if line.start_with? @indentation
              return false
            end
          end
        end
        return true
      end

      return false
    end

    ##
    # Node maker.
    #
    def make_node (kind)
      start = @position

      node = kind.new
      node.start = @position
      node.stop = nil

      if false != (yield node)
        node.stop ||= @position
        return nodenode

      move_to start
      nil
    end

    ##
    # Return the character at given `position`.
    #
    def char_at (position = @position)
      if position >= 0 && position < @length
        @text[position]
      end
    end

    ##
    # Returns a portion of the text, starting from `position` and inlinening
    # through `length` characters or until the end of text is found, whatever
    # comes first.
    #
    def chars (length = 1, from = @position)
      from = [from, @length].min
      length = [length, @length - from].min
      @text[from, length]
    end

    ##
    # Returns next `n` characters, starting from current position, without
    # moving.
    #
    # With default `n` being `1`, this function retrieves the very next
    # character, starting from current position.
    #
    def next_chars (n = 1)
      chars n, (@position + 1)
    end

    ##
    # Returns the very next character.
    #
    def next_char
      next_chars 1
    end

    ##
    # Move to the begining of the next line. If EOT is found before a line
    # break, an exception is raised.
    #
    def move_to_next_line
      eol = (@text.index "\n", @position) || @length

      if eol < (@length - 1)
        move_to eol + 1
      else
        raise 'Cannot move to next line: EOT found'
      end
    end

    ##
    # Peek the entire current line without moving current position.
    #
    def current_line
      eol = (@text.index "\n", @position) || @length - 1
      chars (eol - @position), (@position - @column)
    end

    ##
    # Peek next line without moving current position.
    #
    def next_line
      # Need to find two line breaks
      f = nil
      k = @position

      loop do
        c = char_at k
        if c == "\n" or !c
          return chars (k - f), (f + 1)
        elsif c
          f = k
        else
          break
        end
        k += 1
      end
    end

    ##
    # If __at the beginning__ of a line, skip any consecutive empty (whitespace
    # only) lines, including current one and move to the start of the first non-
    # whitespace line.
    #
    def skip_empty_lines
      if @column != 0
        raise 'Can only skip empty lines from column 0'
      end

      loop do
        line = current_line
        break unless line.strip == ''

        begin
          move_to_next_line
        rescue
          break
        end
      end
    end

    ##
    # Move forward until the current character is not one of the passed `chars`.
    #
    def skip_chars(chars = '')
      skipped = ''

      while @chars && (chars.include? @char) do
        skipped << move
      end

      skipped if skipped.length > 0
    end

    ##
    # Move forward until current character is one of the passed `chars` or end
    # of text is reached.
    #
    def skip_chars_until(chars)
      skipped = ''

      until end_of_text? || (chars.include? @char) do
        skipped << @char
        move
      end

      skipped if skipped.length > 0
    end

    ##
    # Move forward until current character is one of the passed `chars` or end
    # of block is reached.
    #
    def skip_inline_chars_until(chars)
      skipped = ''

      until end_of_block? || (chars.include? @char) do
        skipped << @char
        move
      end

      skipped if skipped.length > 0
    end

    ##
    # Skip any horizontal spacing.
    #
    def skip_spaces
      skip_chars " \t"
    end

    ##
    # Read an atx-style heading.
    #
    def read_atx_heading
      if @char == '#'
        make_node Text::Heading do |node|
          move

          while @char == '#' do
            heading.level += 1
            move
          end

          skip_spaces

          while child = read_inline do
            heading.append child
          end
        end
      end
    end

    ##
    # Read a "setext" heading.
    #
    def read_setext_heading
    end

    ##
    # Read an "atx" or "setext" heading.
    #
    def read_heading
      read_atx_heading ||
      read_setext_heading
    end

    ##
    # Read a character node.
    #
    def read_character
      unless end_of_text?
        make_node Text::Character do |char|
          char.text = @char
          move
        end
      end
    end

    ##
    #
    def read_code_line
      move_to_next_line
      ''
    end

    ##
    # Read an indented `CodeBlock`.
    #
    def read_indented_code_block
    end

    ##
    # Read a _fenced_ `CodeBlock`.
    #
    def read_fenced_code_block
      fence = next_chars 3

      if ['```', '~~~~'].include? fence
        make_node CodeBlock do |node|
          move_to_next_line

          loop do
            if fence == (next_chars 3)
              move 3
              break
            elsif end_of_text?
              break
            end

            line = read_code_line
            # Blah blah
          end
        end
      end
    end

    ##
    # Read a `CodeBlock`.
    #
    def read_code_block
      read_fenced_code_block ||
      read_indented_code_block
    end

    ##
    # Read an `Emphasis` (_lorem_ or __lorem__) node.
    #
    def read_emphasis
      if @char == '_'
        l = next_char == '_' ? 2 : 1
        eoe = chars l

        make_node Text::Emphasis do |emphasis|
          # emphasis.strong? = (l == 2)
          move l

          until eoe == (chars l) do
            if end_of_block?
              raise 'Unterminated _emphasis_'
            end

            if inline = read_inline
              emphasis.append inline
            end
          end

          move l
        end
      end
    end


    ##
    # Read a `Break` node.
    #
    # Only hyphens (`---`) and underscores (`___`) allowed.
    #
    def read_break
      #if start_of
      #if ['```', '~~~~'].include? fence
    end

    ##
    # Read a `Block` level node.
    #
    def read_block
      read_heading ||
      read_quotation_block ||
      read_list ||
      read_code_block ||
      read_break ||
      read_paragraph
    end

    ##
    # Read one or more equally-indented block nodes. Empty lines around blocks
    # are ignored.
    #
    def read_blocks
      back = @position
      blocks = []

      loop do
        break unless block = read_block

        yield block

        blocks << block
        back = @position

        begin
          move_to_next_line
          skip_empty_lines
          skip_indentation
        rescue
          break
        end
      end

      move_to back
      blocks
    end

    ##
    # Start a `Section` node and read its contents.
    #
    def read_section
      make_node Text::Section do |section|
        curr_section, @section = @section, section

        read_blocks do |block|
          # A heading block might start a subsection
          section.append block
        end

        if section.equal? curr_section
          @section.append section
        else
          @section = section
        end
      end
    end

    ##
    # Read meta data from document YAML front matter.
    #
    def read_meta
      {}
    end

    ##
    # Read the document itself.
    #
    def read_document
      if start_of_text?
        make_node Text::Document do |document|
          document.meta = read_meta
          document.body = read_section
        end
      end
    end

    ##
    # Scans a text structure.
    #
    # This method will scan the passed `text` and return, when successfully, a
    # `Document` instance containing the structure of the text.
    #
    def scan (text)
      prepare text
      read_document
    end

    protected :prepare, :make_node, :read_document

  end
  #
  ## class Scanner

end
