module BJCore

import PlayingCards
# import Base: sum
using Accessors, Setfield

export Hand, Shoe, hit!, isA, isTens, is2_6, CountPositive, CountNegative, RunningCount, sum, pop!


mutable struct Shoe
    Cards::Vector{PlayingCards.Card}
    Remaining::Float64
    n::Int
    function Shoe(n::Int)
        Cards = PlayingCards.shuffle!(repeat(PlayingCards.full_deck(),n))
        Remaining = Float64(n)
        new(Cards,Remaining,n)
    end
end

function pop!(cards::Vector{PlayingCards.Card}, n::Integer=1)
    collect(ntuple(i->Base.pop!(cards), n))
end
# Base.pop!(cards::Vector{PlayingCards.Card}, n::Integer = 1) = ntuple(i->Base.pop!(cards), n)
# function Base.pop!(cards::Vector{PlayingCards.Card}, card::PlayingCards.Card)
#     L0 = length(cards)
#     filter!(x -> x ≠ card, cards)
#     L0 == length(cards)+1 || error("Could not pop $(card) from the vector of cards.")
#     return card
# end

mutable struct Hand
    # InitialCards::Pair{Card, Card}
    Cards::Vector{PlayingCards.Card}
    Value::Int
    Bet::Float64
    function Hand(cards::Vector{PlayingCards.Card}=[], Value::Int=0)
        if cards == []
            Cards::Vector{PlayingCards.Card} = []
            Value = 0
            new(Cards, Value, Bet)
        else
            Cards = cards
            Value = sum(Cards)
            new(Cards, Value, Bet)
        end
    end
end

function sum(hand::Vector{PlayingCards.Card})
    value = n_aces = 0
    for card in hand
        r = PlayingCards.rank(card)
        value += min(r, 10)
        n_aces += r == 1
    end
    while value < 12 && n_aces > 0
        value += 10 # treat aces as 11 if beneficial
        n_aces -= 1
    end
    return value
end

function hit!(hand::Hand, shoe::Shoe)
    ## Remove a card from the Shoe
    newCard = first(pop!(shoe.Cards))
    ## How many decks remain, in the shoe?
    shoe.Remaining = round(length(shoe.Cards)/52, digits=2)

    ## Update the Hand struct
    hand.Cards=vcat(hand.Cards, newCard)
    hand.Value=sum(hand.Cards)

    return hand
end

function isA(card::PlayingCards.Card)
    1 == PlayingCards.rank(card)
end

function isTens(card::PlayingCards.Card)
    min(PlayingCards.rank(card),10) == 10
end

function is2_6(card::PlayingCards.Card)
    2<=PlayingCards.rank(card)<= 6
end

function CountNegative(cards::Vector{PlayingCards.Card})
    return count(i -> (isTens(i) || isA(i)), cards)
end

function CountPositive(cards::Vector{PlayingCards.Card})
    return count(i -> (is2_6(i)), cards)
end

function Count(cards::Vector{PlayingCards.Card})
    return CountPositive(cards) - CountNegative(cards)
end

function RunningCount(shoe::Shoe)
    return -1 * Count(shoe.Cards)
end

end
