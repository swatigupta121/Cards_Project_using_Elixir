defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "no_of_cards_in_create_deck" do
    count = length(Cards.create_deck)
    assert count == 12
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck()
    refute deck == Cards.shuffle(deck)
  end
end
