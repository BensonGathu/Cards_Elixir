defmodule Cards do
  @moduledoc"""
    Provides methods for creating and handlind a deckmof cards
    """


  @doc """
  Returns a list of strings representing a deck of playing cards
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

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end
  @doc """
    Determeines whether a deck contains a given card

  ## Examples


      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck,"Ace of Spades")
      true



  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicated how many cards should be in the hand

  ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck,1)
        iex> hand
        ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "That file doesn't exist"
    end
  end

  # def load(filename) do
  #   case File.read(filename) do
  #     {:ok, binary} -> :erlang.binary_to_term(binary)
  #     {:error, reason }-> "That file does not exist"
  #   end
  # end
  def create_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand =  Cards.deal(deck,hand_size)

    # the above code in a pipe operator
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
