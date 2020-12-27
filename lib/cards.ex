defmodule Cards do
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King"
    ]

    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    nested_cards =
      for suit <- suits, value <- values do
        "#{value} #{suit}"
      end

    List.flatten(nested_cards)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save_to_file(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load_file(filename) do
    case File.read(filename) do
      {:ok, binary_data} -> :erlang.binary_to_term(binary_data)
      {:error, _reason} -> "File '#{filename}' does not exist"
    end
  end
end
