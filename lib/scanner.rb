##
# Todo:
# - Code blocks children should be an array of *lines* or something.
# - Ordered lists.
# - Important nodes inside code blocks coments. Extensions should provide
#   this.
# - Important blocks
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
# - The scanner should be extensible with new node classes!!
# - All the other TODOs
##

# Std-lib
require 'yaml'

##
# All known nodes
#
require_relative 'text/location'
require_relative 'text/node'
require_relative 'text/inline'
require_relative 'text/inline/emphasis'
require_relative 'text/inline/important'
require_relative 'text/inline/link'
require_relative 'text/inline/character'
require_relative 'text/inline/literal'
require_relative 'text/inline/literal/code'
require_relative 'text/inline/literal/number'
require_relative 'text/inline/literal/string'
require_relative 'text/block'
require_relative 'text/block/break'
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
#
##

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
    # Index of current character being scanned. When this index is equal to the
    # length of text, it indicates end of text is reached
    #
    attr_reader :position
    #
    ##

    ##
    # Current position, column and line in a `Location` object.
    #
    def location
      if @location.position != @position
        if @position > @length
          @location.column = nil
          @location.line = nil
        else
          position = [@position, @length - 1].min

          if position > @location.position
            lines = @text[@location.position..(position - 1)].split /\n+/
            @location.line += lines.length - 1
            @location.column = lines.last.length
          else
            lines = @text[position..(@location.position.- 1)].split /\n+/
            @location.line -= lines.length - 1

            if position > 0
              # Same as?
              #     @column = position
              #     if line_start = @text.rindex('\n', position - 1)
              #       @column -= (line_start  1)
              #     end
              if line_start = @text.rindex('\n', position - 1)
                @location.column = (position - line_start) + 1
              else
                @location.column = position
              end
            else
              @location.column = 0
            end
          end
        end
        @location.position = @position
      end

      return @location
    end
    #
    ##

    ##
    #
    #
    def column
      @location.column
    end
    #
    ##

    ##
    #
    #
    def line
      @location.line
    end

    ##
    #
    #
    def initialize
      prepare
    end
    #
    ##

    ##
    # Prepare state.
    #
    def prepare(text = '')
      @text = text
      @length = @text.length
      @section = nil
      @indentation = []
      move_to 0 # This sets `@char` to `nil`
      @location = Text::Location.new 0, 0, 0
    end
    #
    ##

    ##
    # Add a level of indentation.
    #
    def indent(ind)
      @indentation << ind
    end
    #
    ##

    ##
    # Remove last level of indentation.
    #
    def unindent
      @indentation.pop
    end
    #
    ##

    ##
    # Get current indentation as a string
    #
    def indentation
      @indentation.join ''
    end
    #
    ##

    ##
    # Move to given `position`.
    #
    def move_to (position)
      unless position.between?(0, @length)
        raise "Cannot move to position #{position}"
      end

      @char = @text[@position = position]
    end
    #
    ##

    ##
    # Move `n` characters starting from current position.
    #
    # The `n` number can be possitive to move forward, negative to move
    # backwards or zero not to move at all. Defaults to `1`, which means
    # `@move()` advances one single position.
    #
    def move(n = 1)
      move_to(@position + n)
    end
    #
    ##

    ##
    # Return `yes` if the end of text has been reached; ie: current position is
    # the same as the text length.
    #
    def end_of_text?
      @position >= @length
    end
    #
    ##

    ###
    # Return `yes` if current position is the last on line; ie: if next
    # character is a line break or the end of the text.
    #
    def end_of_line?
      end_of_text? || @char == '\n'
    end
    #
    ##

    ##
    # Return `yes` if current position is the last on line; ie: if next
    # character is a line break or the end of the text.
    #
    def end_of_block?
      return false unless end_of_line?

      unless end_of_text?
        line = next_line

        if line.trim != ''
          indent = @indentation
          i = indent.length
          if line[0, i] == indent
            return false
          end
        end

        return true
      end

      return false
    end
    #
    ##

    ##
    #
    #
    def make_node(kind)
      start = @position

      node = kind.new
      node.start = location
      node.end = nil

      if false != (yield node)
        node.end ||= location
        return node
      else
        move_to start
        return nil
      end
    end
    #
    ##

    ##
    # Return the character at given `position`.
    #
    def char_at(position = @position)
      if position >= 0 && position < @length
        @text[position]
      end
    end

    ##
    # Returns a portion of the text, starting from `position` and inlinening
    # through `length` characters or until the end of text is found, whatever
    # comes first.
    #
    def chars(length = 1, from = @position)
      from = [from, @length].min
      length = [length, @length - from].min
      @text[from, length]
    end
    #
    ##

    ##
    # Returns next `n` characters, starting from current position, without
    # changing current position.
    #
    # With default `n` being `1`, this function retrieves the very next
    # character starting from current position.
    #
    def next_chars(n = 1)
      chars n, (@position + 1)
    end
    #
    ##

    ##
    # Returns next char.
    #
    def next_char
      chars 1
    end
    #
    ##

    ##
    # Move to the begining of the next line. If EOT is found before a line
    # break, an exception is raised.
    #
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
    #
    ##

    ##
    #
    #
    def current_line
      eol = @text.index "\n", @position
      eol = @length -1 if eol.nil?
      chars (eol - @position), (@position - @column)
    end
    #
    ##

    ##
    # Peek next line.
    #
    def next_line
      # Find two line breaks
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
    #
    ##

    ##
    # If __at the beginning__ of a line, skip any consequtive empty (whitespace
    # only) lines, including current one and move to the start of the first
    # non-whitespace line.
    #
    def skip_empty_lines
      if @column != 0
        raise 'Can only skip empty lines starting at column 0'
      end

      loop do
        line = current_line
        break if line.strip != ''

        begin
          move_to_next_line
        rescue
          break
        end
      end
    end
    #
    ##

    ##
    # Move forward until the current character is not one of the passed `chars`.
    #
    def skip_chars(chars = '')
      skipped = ''

      while @chars && (chars.include? @char) do
        skipped << move
      end

      return skipped if skipped.length > 0
    end
    #
    ##

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

      if skipped.length > 0
        return skipped
      end
    end
    #
    ##

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

      if skipped.length > 0
        return skipped
      end
    end
    #
    ##

    ##
    # Skip any horizontal spacing.
    #
    def skip_spaces
      skip_chars " \t"
    end
    #
    ##

    ##
    # Read an atx-style heading.
    #
    def read_atx_heading
      if @char == '#'
        make_node Text::Heading do |node|
          move

          while (@char == '#') do
            heading.level += 1
            move
          end

          skip_spaces

          while (child = read_inline) do
            heading.append child
          end
        end
      end
    end
    #
    ##

    ##
    # Read a "setext" heading.
    #
    def read_setext_heading
    end
    #
    ##

    ##
    # Read an "atx" or "setext" heading.
    #
    def read_heading
      read_atx_heading ||
      read_setext_heading
    end
    #
    ##

    ##
    #
    #
    def read_character
      unless end_of_text?
        make_node Text::Character do |char|
          char.text = @char
          move
        end
      end
    end
    #
    ##

    ##
    #
    def read_code_line
      move_to_next_line
      ''
    end
    #
    ##

    ##
    # Read an indented `CodeBlock`.
    #
    def read_indented_code_block
    end
    #
    ##

    ##
    # Read a _fenced_ `CodeBlock`.
    #
    def read_fenced_code_block
      fence = next_chars 3

      if ['```', '~~~~'].include? fence
        make_node CodeBlock do |node|
          move_to_next_line

          loop do
            if fence == next_chars(3)
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
    #
    ##

    ##
    # Read a `CodeBlock`.
    #
    def read_code_block
      read_fenced_code_block ||
      read_indented_code_block
    end
    #
    ##

    ##
    # Read an `Emphasis` (_lorem_) or `MoreEmphasis` (__ipsum__) node.
    #
    def read_emphasis
      if @char == '_'
        l = next_char == '_' ? 2 : 1
        eoe = chars l

        make_node Text::Emphasis do |em|
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
    #
    ##

    ##
    # Read a `StringLiteral` node.
    #
    def read_string_literal
      if @char && ("'\"".include? @char)
        q = @char

        make_node Text::StringLiteral do |str|
          loop do
            move
            if end_of_block?
              raise "Unterminated #{q}string#{q} literal"
            end

            break if @char == q
            str.text << @char
            move
          end

          move
        end
      end
    end
    #
    ##

    ##
    # Read a `NumberLiteral` node.
    #
    def read_number_literal
      if /\d/ =~ @char
        make_node Text::NumberLiteral do |num|
          move until end_of_block? || /\d/ !~ @char
        end
      end
    end
    #
    ##

    ##
    # Read an inline `Code` node.
    #
    def read_code_literal
      if @char == '`'
        make_node Text::InlineCode do |code|
          move
          until @char == '`' do
            if end_of_block?
              raise 'Unterminated `code`'
            end
            code.text << @char
            move
          end
        end
      end
    end
    #
    ##

    ##
    # Read any kind of atomic literal node.
    #
    def read_literal
      read_code_literal ||
      read_string_literal ||
      read_number_literal
    end
    #
    ##

    ##
    # Read a link node.
    #
    def read_link
    end
    #
    ##

    ##
    # Read an inline *important* node.
    #
    def read_important
      if @char == '*'
        l = next_char == '*' ? 2 : 1
        eoi = chars l

        make_node Text::Important do |important|
          move l

          until eoi == (chars l) do
            if end_of_block?
              raise 'Unterminated *important*'
            end

            if inline = read_inline
              important.append inline
            end
          end

          move l
        end
      end
    end
    #
    ##

    ##
    # Read an `Inline` node unless current character is at the end of the block.
    #
    def read_inline
      unless end_of_block?
        read_emphasis ||
        read_important ||
        read_link ||
        read_literal ||
        read_character
      end
    end
    #
    ##

    ##
    # Read a `Paragraph` node.
    #
    def read_paragraph
      make_node Text::Paragraph do |paragraph|
        skip_spaces

        while inline = read_inline do
          paragraph.append inline
        end

        return paragraph if paragraph.children?
      end
    end
    #
    ##

    ##
    # Read an ordered list.
    #
    def read_ordered_list
    end
    #
    ##

    ##
    # Read an unordered list.
    #
    def read_unordered_list
      if @char && ('*+-'.include? @char)
        bullet = @char
        back = @position

        # Require whitespace separation
        if next_char == ' '
          make_node Text::UnorderedList do |list|
            list.bullet = bullet

            loop do
              indent '  '
              move 2

              blocks = read_blocks

              if blocks.length > 0
                list_item = new ListItem
                list_item.append *blocks
                list.append list_item
                back = @position
              end

              unindent

              begin
                move_to_next_line
                skip_empty_lines
                skip_indentation
                next if @char == bullet
              end

              move_to back
              break
            end

            list.hasChildren
          end # do |list|
        end # if next_char == ' '
      end
    end
    #
    ##

    ##
    # Read a `List` node, either an `UnorderedList` or an `OrderedList`.
    #
    def read_list
      read_unordered_list ||
      read_ordered_list
    end
    #
    ##

    ##
    #
    #
    def read_quotation_block
    end
    #
    ##

    ##
    #
    def skip_indentation
      indent = indentation
      i = indent.length

      if indent != (chars i, (@position - @column))
        raise "Not the expected indentation (#{i})"
      end

      move(i - @column)
    end
    #
    ##

    ##
    #
    def read_break
    end
    #
    ##

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
    #
    ##

    ##
    # Read one or more equally-indented block nodes. White lines around blocks
    # are ignored.
    #
    def read_blocks
      back = @position
      blocks = []

      loop do
        unless block = read_block
          move_to back
          return nil
        end

        yield block

        blocks << block
        back = @position

        begin
          move_to_next_line
          skip_empty_lines
          skip_indentation
        rescue
          move_to back
          return nil
        end
      end

      blocks
    end
    #
    ##

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
    #
    ##

    ##
    # Read meta data from document YAML front matter.
    #
    def read_meta
      {}
    end
    #
    ##

    ##
    # Read the document itself.
    #
    def read_document
      document = Text::Document.new
      # document.meta = read_meta
      document.body = read_section

      document
    end

    ##
    # Scans a text.
    #
    # This method will scan the passed `text` and return, when successfully, a
    # `Document` instance containing the structure of the text.
    #
    def scan(text)
      prepare text
      read_document
    end
    #
    ##

    protected :prepare, :make_node

  end # class Scanner

end # class Byron
