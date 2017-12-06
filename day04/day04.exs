defmodule Day04 do
  def no_dups?(sentence) do
    words = String.split(sentence)
    words == Enum.uniq(words)
  end

  def sort_words(sentence) do
    sentence
    |> String.split
    |> Enum.map(&Day04.sort_word/1)
    |> Enum.join
  end

  def sort_word(word) do
    word
    |> String.graphemes
    |> Enum.sort
    |> Enum.join
  end
end

File.read!("input.txt")
|> String.split("\n", trim: true)
|> Enum.filter(&Day04.no_dups?/1)
|> length
|> IO.puts

File.read!("input.txt")
|> String.split("\n", trim: true)
|> Enum.map(&Day04.sort_words/1)
|> Enum.filter(&Day04.no_dups?/1)
|> length
|> IO.puts

# File.read!("input.txt")
# |> String.trim
# |> String.split("\n")
# |> Enum.reduce(0, &Day04.check_dups/2)
# |> IO.puts

# "here is a test"
# |> String.split
# |> Enum.sort
# |> IO.inspect

# "testing"
# |> String.graphemes
# |> Enum.sort
# |> IO.inspect

