require 'enumerator'

# lengths = File.read('input.txt').chomp.split(",").each.map(&:to_i) 
lengths = File.read('input.txt').chomp.each_char.map(&:ord)
lengths.concat([17, 31, 73, 47, 23])

list = (0..255).to_a
cur_pos, skip_size = 0, 0

64.times do |i|
  lengths.each do |l|
    list = list.rotate(cur_pos)
    list = list[0, l].reverse + list[l, list.length]
    list = list.rotate(-1 * cur_pos)

    cur_pos += l + skip_size
    skip_size += 1  
  end
end

new_list = []
list.each_slice(16) do |a|
  new_list << a.reduce(:^)
end

output = ""
new_list.each do |n|
  output << sprintf("%02x", n).downcase
end

puts output

# list[0, cur_pos]
# 44310