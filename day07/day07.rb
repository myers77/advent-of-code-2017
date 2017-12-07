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
  if /^(\w+) \((\d+)\)(?: -> (.+))?\n/.match(line)
    matches = /^(\w+) \(\d+\)( -> (.+))?\n/.match(line)
    weights[matches[1]] = /\d+/.match(line)[0].to_i
    if /->(.+)\n/.match(line)
      kids = []
      words = /->(.+)\n/.match(line)[1]
      words.split(", ").each { |word| kids << word.strip }
      children[matches[1]] = kids
    end
  end
end

# weights.each { |k, v| puts v }

def balance(node, children, weights)
  if !children[node]
    return weights[node]
  end

  weight_sum = 0
  children[node].each do |c|
    weight_sum += balance(c, children, weights)
  end
end


puts balance("hmvwl", children, weights)