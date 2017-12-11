defmodule Benchmark do
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end

Benchmark.measure(fn ->
  mystring
  |> Day09.parse
  |> IO.inspect
end)
|> IO.puts
