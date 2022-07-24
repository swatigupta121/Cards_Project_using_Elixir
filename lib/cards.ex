defmodule Cards do

  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three"]
    suits = ["Spades", "Heart", "Diamond", "Clubs"]
    # First way
    # cards=for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end
    # List.flatten(cards)

    # Second way (Much preferrable)
    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffle a deck of playing cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks whether a card is present in the current deck or not. If present then it will return true else false.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains(deck, "Ace of Spades")
      true

  """
  def contains(deck,card) do
    Enum.member?(deck,card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck,1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Save the given deck to a file with the specified file name.
    The `filename` argument indicates the name of the file in which you want to save.
  """
  def save(deck, filename) do
    binary= :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

 @doc """
    Displays the deck saved in a particular file.
    The `filename` argument indicates the name of the file from which you want to fetch data.
  """
  def display(filename) do
    # First way
    # {status, binary} = File.read(filename)

    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "File does not exist!"
    # end

    # Second way
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist!"
    end
  end

  @doc """
    Perform creation of deck, shuffling of deck and creating a hand from the deck at the same time.
  """
  def create_hand(hand_size) do
    {hand, _rest} = Cards.create_deck() |> Cards.shuffle() |> Cards.deal(hand_size)
    hand
  end
end
