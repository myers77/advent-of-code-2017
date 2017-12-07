def redistribute(input)
  max = input.max
  index = input.index(input.max) + 1
  input[input.index(input.max)] = 0

  (1..max).to_a.each do
    input[index % input.size] += 1
    index += 1
  end

  return input
end

input = File.read('input.txt').chomp.split.each.map(&:to_i)
states = Hash.new()

while !states[input.hash]
  states[input.hash] = states.size
  input = redistribute(input.dup)
end

puts states.size
puts states.size - states[input.hash]
