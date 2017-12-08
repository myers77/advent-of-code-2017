input = File.read('input.txt').chomp

vars = Hash.new
vars.default = 0
highest = 0

input.each_line do |line|
  var, op, val, _, ifvar, ifop, ifval = line.split
  highest = [highest, vars.values.max].max if !vars.empty?

  if vars[ifvar].public_send(ifop, ifval.to_i)
    vars[var] += op == 'inc' ? val.to_i : -1 * val.to_i
  end
end

puts vars.values.max
puts highest
