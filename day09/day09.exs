defmodule Day09 do
  def parse(input) do
    store = %{count: 0, depth: 1, skip: false, garbage: false, garbage_count: 0}
    parse_helper(input, store)
  end

  def parse_helper([], store), do: {store[:count], store[:garbage_count]}

  def parse_helper([h | t], store) do
    case {store[:garbage], store[:skip]} do
      {true, true} -> parse_helper(t, %{store | skip: false})
      {true, false} -> case h do
        ?> -> parse_helper(t, %{store | garbage: false})
        ?! -> parse_helper(t, %{store | skip: true})
        _ -> parse_helper(t, %{store | garbage_count: store[:garbage_count] + 1})
      end
      {false, _} -> case h do
        ?{ -> parse_helper(t, %{store | count: store[:count] + store[:depth], depth: store[:depth] + 1})
        ?} -> parse_helper(t, %{store | depth: store[:depth] - 1})
        ?< -> parse_helper(t, %{store | garbage: true})
        _ ->parse_helper(t, store)
      end
      _ -> parse_helper(t, store)
    end
  end
end

defmodule Benchmark do
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end

{:ok, mystring} = File.read "input.txt"
mystring = String.to_charlist(mystring)

Benchmark.measure(fn ->
  mystring
  |> Day09.parse
  |> IO.inspect
end)
|> IO.puts

Benchmark.measure(fn ->
  File.read!("input.txt")
  |> String.to_charlist
  |> Day09.parse
  |> IO.inspect
end)
|> IO.puts


