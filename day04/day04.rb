input = File.read('input.txt').chomp.split("\n").map(&:split)
puts input.count{ |line| line.uniq == line }
puts input.count{ |line| line.map!(&:chars).map!(&:sort).uniq == line }

# puts input.each_line.inject(0) { |sum, line| line.split.uniq! ? sum : sum + 1 }
# puts input.each_line.inject(0) { |sum, line| line.split.map!(&:chars).map!(&:sort).uniq! ? sum : sum + 1 }

# puts File.read('input.txt').chomp.split("\n").map(&:split).count{ |line| !line.uniq! }
# puts input.each_line.select{ |line| !line.split.uniq! }.lengths
# puts input.each_line.count(&:uniq)
# puts input.each_line.select{ |line| !line.split.map!(&:chars).map!(&:sort).uniq! }.length

