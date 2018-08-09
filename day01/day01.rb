input = File.read("input.txt").chomp.chars.map(&:to_i)
input2 = [input.last] + input[0..-2]
input3 = input[input.size/2..-1] + input[0...input.size/2]

puts input.zip(input2).reduce(0) { |acc, a| a[0] == a[1] ? acc + a[0] : acc }
puts input.zip(input3).reduce(0) { |acc, a| a[0] == a[1] ? acc + a[0] : acc }
