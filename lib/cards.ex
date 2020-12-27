defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """

  @doc """
  Returns a list of strings that represents a deck of cards

  ## Examples
      iex> Cards.create_deck()
  """
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

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Receives a deck and returns its cards shuffled.

  ## Examples
      iex> deck = Cards.create_deck()
      iex> Cards.shuffle(deck)
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Determines whether a deck contains a given card

  ## Examples
      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how many cards should
  be in the hand.

  ## Examples
      iex> deck = Cards.create_deck()
      iex> { hand, _deck } = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Save the given deck into a file. The `filename` argument
  indicates how the file should be called.

  ## Examples
      iex> deck = Cards.create_deck()
      iex> Cards.save_to_file(deck, "my_deck")
      :ok
  """
  def save_to_file(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Loads a deck from the file system. The `filename` argument
  should be a string with the name of a previously saved file
  that contains a deck.

  ## Examples
  If the file exists:
      iex> Cards.load_file("my_deck")

  If the file can't be found:
      iex> Cards.load_file("wrong_name")
      "File 'wrong_name' does not exist"
  """
  def load_file(filename) do
    case File.read(filename) do
      {:ok, binary_data} -> :erlang.binary_to_term(binary_data)
      {:error, _reason} -> "File '#{filename}' does not exist"
    end
  end

  @doc """
  Creates a new shuffled deck and a hand. The `hand_size`
  argument defines how much cards should be draw from this
  deck.

  ## Examples
      iex> Cards.create_hand(5)
  """
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
