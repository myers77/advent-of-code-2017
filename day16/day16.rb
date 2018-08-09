require 'set'

lengths = File.read('input.txt').chomp.split(",")

arr = ('a'..'p').to_a
temp = arr

moves = Set.new

(1_000_000_000 % 30).times do |n|
  # break if moves.include? arr.hash
  # moves << arr.hash
  # p moves.size
  lengths.each do |l|
    if matches = /s(\d+)/.match(l)
      arr = arr.rotate(arr.length - matches[1].to_i)
    elsif matches = /x(\d+)\/(\d+)/.match(l)
      arr[matches[1].to_i], arr[matches[2].to_i] = arr[matches[2].to_i], arr[matches[1].to_i]
    elsif matches = /p(\w)\/(\w)/.match(l)
      arr.map! do |x|
        case x
          when matches[1]
            matches[2]
          when matches[2]
            matches[1]
          else
            x
        end
      end
    end
  end
end

# p moves
puts arr.join


# ipgablkmfhcoendj
