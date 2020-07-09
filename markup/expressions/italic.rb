module Expressions
  class Italic
    def pattern
      /(\*{1})(.+)(\*{1})/
    end

    def replacement
      "<italic>\\2</italic>"
    end
  end
end
