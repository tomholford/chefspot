require_relative '../markup'

input = File.readlines('./fixtures/input').map(&:chomp)
expected = File.readlines('./fixtures/output').map(&:chomp)

m = Markup.new(lines: input)
output = m.output

puts 'Expected:'
puts expected.join("\n")
puts ''

puts 'Output:'
puts output
puts ''

puts 'Match?'
output.split("\n").each_with_index do |line, i|
  puts "Line #{i + 1}: #{line == expected[i]}"
end
