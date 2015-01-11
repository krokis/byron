require_relative 'traverser'
require_relative 'token'
require_relative 'text/important'
require_relative 'text/inline/character'

class Byron

  ##
  # The lexer.
  #
  class Lexer < Traverser

    # Known punctuation characters
    @@PUNCTUATION = '\\.,:;'
    @@WORD_STOP = @@PUNCTUATION + " \t\n\r"

    ##
    # Tell if current node or one of its ancestors is considered "important",
    # ie: it is of kind `Text::Important`.
    #
    def important?
      true # !(@node.ancestor Text::Important).nil?
    end

    ##
    # Try to read a single important `Character` token. In case of failure, an
    # exception is raised.
    #
    def read_character (ignore_whitespace = false)
      if important?
        if char = (get_atomic_node Text::Character)
          Token.new char.text, char.start, char.stop
        end
      end
    end

    ##
    # Try to read one or more significant `Character` tokens. In case of
    # failure, an exception is raised.
    #
    def read_characters (ignore_whitespace = false)
      start = @node
      token = Token.new

      skip_whitespace if ignore_whitespace

      while char = read_character
        token.text << char.text
        token.start ||= token.start
        token.stop = char.stop
      end

      if token.stop
        token
      else
        move_to start
        nil
      end
    end

    ##
    # Try to read one or more significant `Character` nodes until one matches
    # one of the passed `delim` characters.
    #
    def read_characters_until (delim, ignore_whitespace = false)
      start = @node
      token = Token.new ''

      skip_whitespace if ignore_whitespace

      prev = @node

      while char = read_character

        if delim.include? char.value.downcase
          move_to prev
          break
        end

        token.value << char.value
        token.start ||= char.start
        token.stop = char.stop

        prev = @node
      end

      if token.stop
        token
      else
        move_to start
        nil
      end
    end

    ##
    # Try to read one or more significant whitespace characters.
    #
    def read_whitespace
      if important?
        start = @node
        if node = (get_atomic_node Text::Character)
          if node.text.strip == ''
            return Token.new node.text, node.start, node.stop
          end
        end
        move_to start
        return nil
      end
    end

    ##
    # Skip any consecutive significant whitespace characters.
    #
    def skip_whitespace
      until end_of_text? do
        space = read_whitespace
        break unless space
      end
    end

    ##
    # Read consecutive non-punctuation characters inside an important element.
    #
    def read_word (ignore_whitespace = true)
      read_characters_until @@WORD_STOP, ignore_whitespace
    end

    ##
    # Read a significant punctuation character
    #
    def read_punctuation (ignore_whitespace = true)
      if important?
        start = @node
        if char = (read_character ignore_whitespace)
          if @@PUNCTUATION.include? char.value
            return char
          end
        end
        move_to start
      end

      nil
    end

    ##
    # Read non significative (not inside an *important* node) `Character` or
    # `Whitespace` nodes.
    #
    def read_blah
      until important? do
        break unless get_node
      end
    end

    ##
    # Skip blah tokens.
    #
    def skip_blah
      while read_blah do; end
    end
  end
  #
  ##

end
