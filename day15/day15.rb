require 'benchmark'

def step(var, fac, divisor)
  begin
    var = (var * fac) % 2147483647
  end until var % divisor == 0

  return var
end

def run
  a, b = step(783, 16807, 4), step(325, 48271, 8)
  sum = 0
  mask = 65535
  5000000.times do
    a, b = step(a, 16807, 4), step(b, 48271, 8)
    sum += 1 if mask & a == mask & b
  end

  puts sum
end

puts Benchmark.measure { run }
