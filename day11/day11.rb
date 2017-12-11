require "test/unit"

def run(input)
  max = 0
  coords = { x: 0, y: 0, z: 0 }

  input.each do |i|
    coords = step(coords, i)
    max = [distance(coords), max].max
  end

  return [distance(coords), max]
end

def step(coords, dir)
  case dir
    when 'n'
      coords[:y] += 1
      coords[:z] -= 1
    when 'ne'
      coords[:x] += 1
      coords[:z] -= 1
    when 'nw'
      coords[:y] += 1
      coords[:x] -= 1
    when 's'
      coords[:y] -= 1
      coords[:z] += 1
    when 'se'
      coords[:y] -= 1
      coords[:x] += 1
    when 'sw'
      coords[:x] -= 1
      coords[:z] += 1
  end

  coords
end

def distance(coords)
  coords.values.map(&:abs).reduce(:+) / 2
end

puts 3 == run(['ne', 'ne', 'ne'])[0]
puts 0 == run(['ne', 'ne', 'sw', 'sw'])[0]
puts 2 == run(['ne', 'ne', 's', 's'])[0]
puts 3 == run(['se', 'sw', 'se', 'sw', 'sw'])[0]

puts run(File.read('input.txt').chomp.split(","))
