defmodule CardsTest do
  use ExUnit.Case

  # doctests (tests examples in the codes documentation)
  doctest Cards

  # Case tests
  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 52
  end

  test "shuffle_working" do

    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)
  end
end
