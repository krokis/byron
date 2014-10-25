require_relative 'text/inline/character'
require_relative 'traverser'
require_relative 'token'

class Byron

  ##
  # The lexer.
  #
  class Lexer < Traverser

    # Punctuation characters
    PUNCTUATION = '\\.,:;'

    ##
    # Try to read a single `Character` node and return its text. In case of
    # failure, an exception is raised.
    #
    def read_character (ignore_whitespace = false)
      if important?
        begin
          if char = (get_atomic_node Text::Character)
            Token.new char.text, char, char
          end
        end
      end

      raise 'Cannot read a `Character`'
    end

    ##
    # Try to read one or more significant `Character` nodes and return their
    # text. In case of failure, an exception is raised.
    #
    def read_characters (ignore_whitespace = false)
      start = @node
      token = Token.new

      begin
        skip_whitespace if ignore_whitespace

        while char = read_character
          token.text << char.text
          token.start ||= token.start
          token.end = char.end
        end
      end

      return token if token.end

      move_to start

      raise 'Cannot read any `Character`'
    end
    #
    ##

    ##
    # Try to read one or more significant `Character` nodes until one matches
    # one of the passed `delim` characters. In case of failure, a `LexerFail` is thrown.
    #
    def read_characters_until (delim, ignore_whitespace = false)
      start = @node
      token = Token.new

      begin
        skip_whitespace if ignore_whitespace

        prev = @node

        while char = read_character
          if delim.include? char.to_lower
            move_to prev
            break
          end

          token.text << char.text
          token.start ||= char.start
          token.end = char.end

          prev = @node
        end
      end

      return token if token.end

      move_to start
      raise 'Cannot read any `Character`'
    end
    #
    ##

    ##
    # Try to read one or more significant whitespace characters.
    #
    def read_whitespace
      if important?
        begin
          node = get_atomic_node Text::Character
          if node.text.strip == ''
            Token.new node.text, node.start, node.end
          end
        end
      end

      raise 'Cannot read a whitespace node'
    end
    #
    ##

    ##
    # Skip any consequitive significant whitespace characters.
    #
    def skip_whitespace
      begin
        read_whitespace until end_of_text?
      rescue
      end
    end
    #
    ##

    ##
    # Read consecutive non-punctuation characters inside an important element.
    #
    def read_word (ignore_whitespace = true)
      read_characters_until @@PUNCTUATION, ignore_whitespace
    end
    #
    ##

    ##
    # Read a significant punctuation character
    #
    def read_punctuation (ignore_whitespace = true)
      if important?
        begin
          char = read_character ignore_whitespace
          return char if @@PUNCTUATION.include? char.text
        end
      end

      raise 'Cannot read a `Punctuation`'
    end
    #
    ##

    ##
    # Read non significative (not inside an *important* node) `Character` or
    # `Whitespace` nodes.
    #
    def read_blah
      unless important?
        chars = ''

        begin
          chars << (get_atomic_node Text::Character).text
        rescue e
          raise e
        end
      else
        raise 'Cannot read blah characters'
      end

      until important? do
        begin
          chars << (get_atomic_node Text::Character).text
        end
      end

      chars.length > 0 ? chars : nil
    end
    #
    ##

    ##
    # Skip blah tokens.
    #
    def skip_blah
      begin
        read_blah
      end
    end
    #
    ##

  end
  #
  ## class Lexer

end
#
## class Byron
