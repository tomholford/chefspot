module Expressions
  class Item
    def pattern
      /^(\-{1}\s{1})(.+)/
    end

    def replacement
      "<item>\\2</item>"
    end
  end
end
