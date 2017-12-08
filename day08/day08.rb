input = File.read('input.txt').chomp

vars = Hash.new
vars.default = 0
highest = 0

input.each_line do |line|
  matches = /^(\w+) (\w+) (-?\d+) if (\w+) (.+) (-?\d+)/.match(line)
  highest = [highest, vars.values.max].max if !vars.empty?

  if vars[matches[4]].public_send(matches[5], matches[6].to_i)
    vars[matches[1]] += matches[2] == 'inc' ? matches[3].to_i : -1 * matches[3].to_i
  end
end

puts vars.values.max
puts highest
