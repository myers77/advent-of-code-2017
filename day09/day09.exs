defmodule Day09 do
  def parse(input) do
    store = %{count: 0, depth: 1, skip: false, garbage: false, garbage_count: 0}

    input
    |> Enum.reduce(store, fn(char, store) -> parse_helper(char, store) end)
    |> fn(store) -> {store[:count], store[:garbage_count]} end.()
  end

  def parse_helper(char, %{garbage: false} = store) do
    case char do
      ?{ -> %{store | count: store[:count] + store[:depth], depth: store[:depth] + 1}
      ?} -> %{store | depth: store[:depth] - 1}
      ?< -> %{store | garbage: true}
      _ -> store
    end
  end

  def parse_helper(_, %{garbage: true, skip: true} = store), do: %{store | skip: false}
  def parse_helper(char, %{garbage: true, skip: false} = store) do
    case char do
      ?> -> %{store | garbage: false}
      ?! -> %{store | skip: true}
      _ -> %{store | garbage_count: store[:garbage_count] + 1}
    end
  end
end

File.read!("input.txt")
  |> String.to_charlist
  |> Day09.parse
  |> IO.inspect
