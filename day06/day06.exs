defmodule Day06 do
  def first(banks) do
    count = 0
    hash = :crypto.hash(:sha, banks)
    list = %{ hash => count}
  end

  def run(banks) do
    max = Enum.max(banks)
    Day06.split_at_max(banks, max, 1)
    |> Day06.redistribute
  end

  def redistribute([banks, sum, offset]) do
    [h | t] = banks
    case sum do
      0 -> Day06.rebuild(banks, offset)
      _ -> Day06.redistribute([t ++ [h + 1], sum - 1, rem((offset + 1), length(banks))])
    end
  end

  def rebuild(banks, offset) do
    [h | t] = Enum.chunk_every(banks, length(banks) - offset)
    Enum.concat(t) ++ h
  end

  def split_at_max([h | t], max, offset) do
    IO.inspect(h)
    IO.inspect(t)
    case h == max do
      true -> [t ++ [0], max, offset]
      false -> split_at_max(t ++ [h], max, offset + 1)
    end   
  end
end


Day06.run([14, 0, 15, 12, 11, 11, 3, 5, 1, 6, 8, 4, 9, 1, 8, 4])
|> Day06.run
|> IO.inspect
