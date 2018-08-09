def run(input)
  a = {
    vars: { p: 0 },
    step: 0
  }
  b = {
    vars: { p: 1 },
    step: 0
  }

  while input[a[:step]] || input[b[:step]] || (a[:looping?] && b[:looping?])
    cmd, var, val = input[step].split
    val = vars[val] if vars[val]

    case cmd
      when "snd"

      when "rcv"

      when "set"
        vars[var] = val.to_i
      when "add"
        vars[var] += val.to_i
      when "mul"
        vars[var] *= val.to_i
      when "mod"
        vars[var] %= val.to_i
      when "rcv"
        return last_sound if vars[var] > 0
      when "jgz"
        step += (val.to_i - 1) if vars[var] > 0
    end

    step += 1
  end

  return last_sound
end

puts run(File.read('input.txt').chomp.split("\n"))


# not 0
# not 2147483647
