steps = 366

pos = 0
val = 0

(1..50_000_000).each do |i|
  pos = (pos + steps + 1) % i
  val = i if pos == 0
end

puts val
