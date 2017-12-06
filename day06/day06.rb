input = File.read('input.txt').chomp.split.each.map(&:to_i)

# puts input.each_line.inject(0) { |sum, line| line.split.uniq! ? sum : sum + 1 }
# puts input.each_line.inject(0) { |sum, line| line.split.map!(&:chars).map!(&:sort).uniq! ? sum : sum + 1 }

# puts input.each_line.select{ |line| !line.split.uniq! }.length
# puts input.each_line.select{ |line| !line.split.map!(&:chars).map!(&:sort).uniq! }.length
steps = 0
states = []
states << input.dup.hash

while states.uniq == states
  new_input = input
  max = input.max
  index = input.find_index(input.max) + 1
  input[input.find_index(input.max)] = 0
  remaining = max

  while remaining > 0
    if index == input.size
      index = 0
    end
    input[index] += 1
    remaining -= 1
    index += 1
  end

  states << input.dup.hash
  steps += 1
end
puts steps
puts states.index(states.last)
p states.each_index.select{|i| states[i] == states.last} # =>[0, 2, 6]
# input.each_with_index do |val, i|
#   next if i == input.find_index(input.max) 

# end

# while 