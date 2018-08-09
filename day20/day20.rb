require "matrix"

def parse_input(input)
  input.each_line.reduce([]) { |vectors, l| vectors << parse_line(l) }
end

def parse_line(line)
  line.scan(/(\w)=<(.*?)>/).reduce({}) do |acc, line|
    acc.update(line[0].to_sym => Vector.elements(line[1].split(",").map(&:to_i)))
  end
end

def tick
  lambda do |v|
    v[:v] += v[:a]
    v[:p] += v[:v]
  end
end

def remove_collisions(vectors)
  if temp = vectors.uniq{ |v| v[:p] }
    removed = vectors - temp
    vectors.reject!{ |v| removed.any?{ |r| r[:p] == v[:p] } }
  end
  return vectors
end

vectors = parse_input(File.read("input.txt").chomp)
50.times do
  vectors.map(&tick)
  vectors = remove_collisions(vectors)
end
puts vectors.size

# puts vectors[0]
# puts vectors.min{ |v| v[:p].magnitude }
# puts vectors.index(vectors.min{ |a, b| a[:p].magnitude <=> b[:p].magnitude})

# 0, 66 wrong
