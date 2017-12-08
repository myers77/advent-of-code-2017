# Read to integer array
# Read to string
input = File.read('input.txt').chomp

# roots = []
# pointers = []

# input.each_line do |line|
#   roots << /^(\w+)/.match(line)[0]
#   if /->(.+)\n/.match(line)
#     words = /->(.+)\n/.match(line)[1]
#     words.split(", ").each { |word| pointers << word.strip }
#   end
# end

# p roots - pointers

weights = Hash.new
children = Hash.new

input.each_line do |line|
  matches = /^(\w+) \((\d+)\)(?: ->(.+))?/.match(line)
  weights[matches[1]] = matches[2].to_i
  if matches[3]
    children[matches[1]] = matches[3].strip.split(', ')
  end
end


def get_total_weight(node, children, weights)
  if !children[node]
    return weights[node]
  end

  return children[node].each.inject(weights[node]) { |sum, node| sum + get_total_weight(node, children, weights) }
end

def check_balance(node, children, weights)
  child_weights = []

  children[node].each do |child|
    child_weights << get_total_weight(node, children, weights)
  end

  if ()

  puts child_weights
end

puts check_balance("hmvwl", children, weights)
