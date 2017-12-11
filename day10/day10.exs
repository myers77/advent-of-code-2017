defmodule Day10 do
  def parse(input) do
    run_reverse(Enum.to_list(0..255), input, 0, 0)
    |> Enum.take(2)
    |> Enum.reduce(&*/2)
  end

  def parse2(input) do
    run_reverse(Enum.to_list(0..255), input, 0, 0)
    |> Enum.take(2)
    |> Enum.reduce(&*/2)
  end

  def run_reverse(list, [], cur_pos, skip_size), do: list

  def run_reverse(list, [h | t], cur_pos, skip_size) do
    list
    |> Day10.rotate(cur_pos)
    |> Enum.split(h)
    |> Day10.reverse_start
    |> Day10.rotate(cur_pos * -1)
    |> Day10.run_reverse(t, rem(cur_pos + skip_size + h, length(list)), skip_size + 1)
  end

  def reverse_start({a, b}) do
    Enum.reverse(a) ++ b
  end

  def rotate(list, len) do
    list
    |> Enum.split(len)
    |> fn({a, b}) -> b ++ a end.()
    |> List.flatten
  end
end

# File.read!("input.txt")
# |> String.split(",", trim: true)
# |> Enum.map(&String.to_integer/1)
# |> Day10.parse
# |> IO.inspect

File.read!("input.txt")
|> String.trim
|> String.to_charlist
|> Enum.concat([1, 2, 3])
|> Day10.parse2
# |> Enum.map(&String.to_integer/1)
# |> Day10.parse
|> IO.inspect
