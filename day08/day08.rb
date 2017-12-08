input = File.read('input.txt').chomp

vars = Hash.new
vars.default = 0

highest = 0

input.each_line do |line|
  matches = /^(\w+) (\w+) (-?\d+) if (\w+) (.+) (-?\d+)/.match(line)

  if !vars.empty? && vars.values.max > highest
    highest = vars.values.max
  end

  if vars[matches[4]].public_send(matches[5], matches[6].to_i)
    puts matches[0]
    if matches[2] == 'inc'
      vars[matches[1]] += matches[3].to_i
    else
      vars[matches[1]] -= matches[3].to_i
    end
  end
end

def largest_hash_key(hash)
  hash.max_by{|k,v| v}
end

puts vars
puts largest_hash_key(vars)
puts highest

# 6839
