require_relative 'expressions/bold'
require_relative 'expressions/italic'
require_relative 'expressions/item'
require_relative 'expressions/keyword'
require_relative 'expressions/list'

class Markup
  attr_accessor :lines

  def initialize(lines:)
    @lines = lines
  end

  def output
    # special case for List
    body = lines.join("\n")
    list_expr = Expressions::List.new
    body.gsub!(list_expr.pattern, list_expr.replacement)
    split_lines = body.split("\n")

    exprs = [
      Expressions::Bold.new,
      Expressions::Italic.new,
      Expressions::Keyword.new,
      Expressions::Item.new
    ]

    split_lines.map do |line|
      exprs.reduce(line) { |memo, expr| memo.gsub(expr.pattern, expr.replacement) }
    end.join("\n")
  end
end
