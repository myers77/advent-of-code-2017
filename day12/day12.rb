require 'set'

pipes = Hash.new
nodes = Set.new

input = File.read('input.txt').chomp.each_line.map(&:split)
#   pipes[l[0].to_i] = l[1].split(", ").each.map(&:to_i)

# def get_groups(nodes, pipes)
#   all_visited = Set.new
#   groups = 0
#   pipes.each do |k, v|
#     nodes = get_children(k, Set.new, pipes)
#     if !nodes.intersect?(all_visited)
#       groups += 1
#       all_visited.merge(nodes)
#     end
#   end
#   return groups
# end

# def get_children(node, nodes, pipes)
#   if !pipes[node] || nodes.include?(node)
#     return
#   end

#   nodes << node
#   pipes[node].each do |n|
#     get_children(n, nodes, pipes)
#   end

#  nodes
# end

# puts get_groups(nodes, pipes)
