input = File.read('input.txt').chomp.split(",")

max = 0
moves = Hash.new
moves.default = 0

input.each do |i|
  moves[i] += 1

  a = moves["nw"] - moves["se"]
  max = [(moves["s"] - moves["n"] - a).abs + (moves["ne"] - moves["sw"] - a).abs, max].max
end

puts max
