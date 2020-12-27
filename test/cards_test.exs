defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 52
  end

  test "shuffling a deck randomizes its cards positions" do
    deck = Cards.create_deck()
    refute deck == Cards.shuffle(deck)
  end

  test "contains should return true" do
    deck = Cards.create_deck()
    assert Cards.contains?(deck, "Ace of Spades") == true
  end

  test "contains should return false" do
    deck = Cards.create_deck()
    refute Cards.contains?(deck, "Unexistent card") == true
  end
end
