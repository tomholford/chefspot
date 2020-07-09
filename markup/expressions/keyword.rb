module Expressions
  class Keyword
    def pattern
      /(\%{1})(.+?)(\%{1})/
    end

    def replacement
      "<keyword>\\2</keyword>"
    end
  end
end
