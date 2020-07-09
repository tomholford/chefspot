module Expressions
  class List
    def pattern
      /(^\-{1}\s.+\-{1}\s{1}.+?$)/m
    end

    def replacement
      "<list>\n\\1\n</list>"
    end
  end
end
