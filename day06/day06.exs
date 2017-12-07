defmodule Day06 do
  def run(banks) do
    [a, max, b] = Day06.split_at_max(banks)
    IO.inspect(b ++ a)
    Day06.redistribute(a ++ b, max, length(a))
  end

  def redistribute(banks, sum, offset) do
    [h | t] = banks
    case sum do
      0 -> Day06.rebuild(banks, offset)
      _ -> Day06.redistribute(t ++ [h + 1], sum - 1, rem((offset + 1), length(banks)))
    end
  end

  def rebuild(banks, offset) do
    [h | t] = Enum.chunk_every(banks, length(banks) - offset)
    Enum.concat(t) ++ h
  end

  def sort_words(sentence) do
    sentence
    |> String.split
    |> Enum.map(&Day06.sort_word/1)
    |> Enum.join
  end

  def split_at_max(list) do
    [a, max, b] = Enum.chunk_by(list, fn(x) -> x == Enum.max(list) end)
    [a ++ [0], max, b]
  end
end

# File.read!("input.txt")
# |> String.split
# |> Enum.map(&String.to_integer/1)
# |> Day06.run
# |> IO.inspect
# |> length
# |> IO.puts

Day06.run([14, 0, 15, 12, 11, 11, 3, 5, 1, 6, 8, 4, 9, 1, 8, 4])
|> IO.inspect
#  OFF BY ONE with highest
