input = File.read("input.txt").chomp

map = Hash.new

input.each_line.with_index do |line, y|
  line.chomp.chars.each_with_index do |char, x|
    map[[y, x]] = char if char != " "
  end
end

def get_neighbors(cur)
  return [[cur[0], cur[1] + 1],
    [cur[0], cur[1] - 1],
    [cur[0] + 1, cur[1]],
    [cur[0] - 1, cur[1]]]
end

cur = []

0.step do |x|
  if map[[0, x]]
    cur = [0, x]
    break
  end
end

prev = [-1, cur[1]]

total = ""
steps = 0
loop do
  p map[cur]
  break if !map[cur]
  if map[cur] == "+"
    temp = cur.dup
    cur = get_neighbors(cur).find{ |x| map[x] && map[x] != map[prev]}
    prev = temp
  else
    if /[A-Z]/.match(map[cur])
      total << map[cur]
    end
    temp = prev
    prev = cur.dup
    cur[0] += cur[0] - temp[0]
    cur[1] += cur[1] - temp[1]
  end
  steps += 1
end

puts steps

# 18059 wrong
