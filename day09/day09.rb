input = File.read('input.txt').chomp

count, garbage_count = 0, 0
depth = 1
skip, garbage = false, false

input.each_char do |c|
  if garbage && skip
    skip = false
  elsif garbage && !skip
    case c
      when '>'
          garbage = false
      when '!'
        skip = true
      else
        garbage_count += 1
    end
  else
    case c
      when '{'
        count += depth
        depth += 1
      when '}'
        depth -= 1
      when '<'
        garbage = true
      else
        next
    end
  end
end

puts count
puts garbage_count
