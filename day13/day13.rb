delay, wall = 0, File.read('input.txt').each_line.map{ |l| l.split(":").map(&:to_i) }.sort_by(&:last)
delay += 1 while wall.find { |step| (step[0] + delay) % ((step[1] - 1) * 2) == 0 }
puts delay
