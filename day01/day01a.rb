input = File.read('input.txt').chomp
prevchar = input[0]
firstchar = prevchar
sum = 0

input[0] = ''

input.each_char do |c|
  sum += prevchar.to_i if prevchar == c
  puts "#{prevchar}, #{c}" if prevchar == c
  prevchar = c
end

sum += prevchar.to_i if firstchar == prevchar

puts sum
