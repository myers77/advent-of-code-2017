input = File.read('input.txt').chomp.split(",").each.map(&:to_i)

index, step = 0, 0
while index.between?(0, input.size - 1)
  jump, input[index] = input[index], input[index] + 1
  index, step = index + jump, step + 1
end
puts step

input = File.read('input.txt').chomp.split.each.map(&:to_i)

index, step = 0, 0
while index.between?(0, input.size - 1)
  jump, input[index] = input[index], input[index] >= 3 ? input[index] - 1 : input[index] + 1
  index, step = index + jump, step + 1
end
puts step
