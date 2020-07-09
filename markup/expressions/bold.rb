module Expressions
  class Bold
    def pattern
      /(\*{2})(.+?)(\*{2})/
    end

    def replacement
      "<bold>\\2</bold>"
    end
  end
end
