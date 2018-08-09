require 'enumerator'
require 'set'

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

def find_group(set)
  to_visit = [set.first]
  visited = Set.new

  while !to_visit.empty?
    cur = to_visit.pop
    visited << cur

    [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |(y, x)|
      neighbor = [cur[0] + y, cur[1] + x]
      to_visit << neighbor if set.include?(neighbor) && !visited.include?(neighbor)
    end
  end

  return visited
end

hashes = []
128.times do |i|
  lengths = File.read('input.txt').chomp << "-#{i}"
  lengths = lengths.each_char.map(&:ord).concat([17, 31, 73, 47, 23])
  list, _, _ = knot_hash((0..255).to_a, lengths, 0, 0, 64)
  hashes << list.each_slice(16).reduce([]) { |acc, n| acc.push(*("%08b" % n.reduce(:^)).chars.map(&:to_i)) }
end

used_squares = hashes.each_with_index.reduce(Set.new) do |acc, (row, y)|
  row.each_with_index do |cell, x|
    used_squares << [y, x] if cell == 1
  end
end

p used_squares.size

groups = 0
until used_squares.empty?
  used_squares.subtract(find_group(used_squares))
  groups += 1
end

puts groups

# refactor to use single-dimensional array, +1 -1 and +rowlen -rowlen
