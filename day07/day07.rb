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

# def get_total_weight(node, children, weights)
#   return weights[node] if !children[node]

#   return children[node].each.inject(weights[node]) { |sum, node| sum + get_total_weight(node, children, weights) }
# end

def check_balance(node, children, weights)
  if !children[node]
    return weights[node]
  end

  child_weights = {}
  weights_arr = []

  children[node].each do |child|
    # sum + weights[node2] + check_balance(node2, children, weights)
    temp = check_balance(child, children, weights)
    child_weights[child] = temp
    weights_arr << temp
    # weights_arr << children[child].each.inject(weights[child]) { |sum, node2| sum + weights[node2] }
  end

  print node, weights_arr, "\n"

  choices = child_weights.select { |k, v| v > 1 }
  p choices

  if weights_arr.uniq.size != 1
    raise "bad mp3 encoding"
  end

  return weights_arr.sum + weights[node]
end

# children.each do |k, v|
#   next if !children[node]

#   v.each.inject(weights[node]) { |sum, node| sum + get_total_weight(node, children, weights) }

#   v.each do |kid|

# end

puts check_balance("hmvwl", children, weights)






# def check_balance(node, children, weights)
#   if !children[node]
#     puts node
#     return weights[node]
#   end

#   child_weights = {}
#   weights_arr = []

#   children[node].each do |child|
#     child_weights[child] = children[child].each.inject(weights[child]) { |sum, node2| sum + weights[node2] }
#     weights_arr << children[child].each.inject(weights[child]) { |sum, node2| sum + weights[node2] }
#   end

#   child_weights.each_with_object(Hash.new(0)){|key,hash| hash[key] += 1 }
#   if weights_arr.uniq.size == 1
#     children[node].each do |child|
#       check_balance(child, children, weights)
#     end
#   end
#   child_weights
# end
