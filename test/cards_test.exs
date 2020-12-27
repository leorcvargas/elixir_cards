defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "should create a deck with 48 decks" do
    deck = Cards.create_deck()
    assert(length(deck) === 52)
  end
end
