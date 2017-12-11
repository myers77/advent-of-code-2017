input = File.read('input.txt').chomp

roots = []
pointers = []

input.each_line do |line|
  roots << /^(\w+)/.match(line)[0]
  if /->(.+)\n/.match(line)
    words = /->(.+)\n/.match(line)[1]
    words.split(", ").each { |word| pointers << word.strip }
  end
end

root = [roots - pointers][0]
puts root

weights = Hash.new
children = Hash.new

input.each_line do |line|
  matches = /^(\w+) \((\d+)\)(?: ->(.+))?/.match(line)
  weights[matches[1]] = matches[2].to_i
  if matches[3]
    children[matches[1]] = matches[3].strip.split(', ')
  end
end


def check_balance(node, children, weights)
  if !children[node]
    return weights[node]
  end

  child_weights = {}
  weights_arr = []

  children[node].each do |child|
    temp = check_balance(child, children, weights)
    child_weights[child] = temp
    weights_arr << temp
  end

  choices = child_weights.select { |k, v| v > 1 }

  if weights_arr.uniq.size != 1
    p choices
  end

  return weights_arr.sum + weights[node]
end

check_balance(root, children, weights)
