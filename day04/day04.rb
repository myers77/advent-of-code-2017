input = File.read('input.txt').chomp

# puts input.each_line.inject(0) { |sum, line| line.split.uniq! ? sum : sum + 1 }
# puts input.each_line.inject(0) { |sum, line| line.split.map!(&:chars).map!(&:sort).uniq! ? sum : sum + 1 }

puts input.each_line.select{ |line| !line.split.uniq! }.length
puts input.each_line.select{ |line| !line.split.map!(&:chars).map!(&:sort).uniq! }.length
