# input = File.read('input.txt').chomp

# puts input.each_line.inject(0) { |sum, line| line.split.uniq! ? sum : sum + 1 }
# puts input.each_line.inject(0) { |sum, line| line.split.map!(&:chars).map!(&:sort).uniq! ? sum : sum + 1 }

# File.read!("input.txt")


def create_deck do
  values = ["Ace", "Two", "Three", "Four", "Five"]
  suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

  for suit <- suits, value <- values do
    "#{value} of #{suit}"
  end
end

def load(sentence, acc) do
  String.split(sentence)
  |> Enum.map(String.graphemes |> Enum.sort)


  |> Enum.sort

  case File.read(filename) do
    {:ok, binary} -> :erlang.binary_to_term binary
    {:error, _reason} -> "That file does not exist"
  end
end

"testing"
|> String.graphemes
|> Enum.sort
|> IO.puts

Enum.reduce([1, 2, 3], 0, fn(x, acc) -> x + acc end)
