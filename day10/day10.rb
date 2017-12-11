require 'enumerator'

def knot_hash(list, lengths, cur_pos, skip_size, rounds)
  rounds.times do
    lengths.each do |l|
      list = list.rotate(cur_pos)
      list = list[0, l].reverse + list[l, list.length]
      list = list.rotate(-1 * cur_pos)

      cur_pos += l + skip_size
      skip_size += 1
    end
  end

  [list, cur_pos, skip_size]
end

lengths = File.read('input.txt').chomp.split(",").each.map(&:to_i)
list, _, _ = knot_hash((0..255).to_a, lengths, 0, 0, 1)
puts list[0] * list[1]


lengths = File.read('input.txt').chomp.each_char.map(&:ord).concat([17, 31, 73, 47, 23])
list, _, _ = knot_hash((0..255).to_a, lengths, 0, 0, 64)
puts list.each_slice(16).reduce("") { |acc, n| acc << sprintf("%02x", n.reduce(:^)).downcase }
