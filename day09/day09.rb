input = File.read('input.txt').chomp

count = 0
depth = 1
skip, garbage = false
garbage_count = 0

input.each_char do |c|
  if garbage && skip
    skip = false
    next
  end

  if !garbage
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
  else
    case c
      when '>'
        if !skip
          garbage = false
        end
      when '!'
        skip = true
      else
        garbage_count += 1
    end
  end
end

puts garbage_count
