defmodule Day09 do
  def parse(input) do
    store = %{count: 0, depth: 1, skip: false, garbage: false, garbage_count: 0}
    parse_helper(input, store)
  end

  def parse_helper([], store), do: {store[:count], store[:garbage_count]}

  def parse_helper([h | t], %{garbage: false} = store) do
    case h do
      ?{ -> parse_helper(t, %{store | count: store[:count] + store[:depth], depth: store[:depth] + 1})
      ?} -> parse_helper(t, %{store | depth: store[:depth] - 1})
      ?< -> parse_helper(t, %{store | garbage: true})
      _ ->parse_helper(t, store)
    end
  end

  def parse_helper([_h | t], %{garbage: true, skip: true} = store), do: parse_helper(t, %{store | skip: false})

  def parse_helper([h | t], %{garbage: true, skip: false} = store) do
    case h do
      ?> -> parse_helper(t, %{store | garbage: false})
      ?! -> parse_helper(t, %{store | skip: true})
      _ -> parse_helper(t, %{store | garbage_count: store[:garbage_count] + 1})
    end
  end
end

File.read!("input.txt")
  |> String.to_charlist
  |> Day09.parse
  |> IO.inspect
