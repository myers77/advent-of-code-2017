defmodule Day08 do
  def parse(input) do
    input
    |> Enum.reduce(0, fn(line, acc) -> run_line(line, acc) end)
  end

  def run_line(line, acc) do
    [var, op, val, _, ifvar, ifop, ifval] = String.split(line)

    # Code.eval_string("a = a + b", [a: 1, b: 2])

    # code_string = String.

    ["if", ifvar, ifop, ifval, "do", var, op, val]
    |> Enum.join " "
    |> Code.eval_string([])

    # Code.eval_string("if", [a: 1, b: 2])

    # acc
    # |> Map.get(var, 0)
    # IO.inspect(val)
    {acc | var: var, ifvar: ifvar}
  end

  def parse_op(acc, var, op, val) do
    case op do
      "==" -> acc[var] == val
      "!=" -> acc[var] != val
      ">=" -> acc[var] >= val
      "<=" -> acc[var] <= val
      ">" -> acc[var] > val
      "<" -> acc[var] < val
    end
  end
end

File.read!("input.txt")
  |> String.split("\n", trim: true)
  |> Day08.parse
  |> IO.inspect
