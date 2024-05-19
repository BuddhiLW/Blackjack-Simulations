module Game

include("../constants/core.jl")
include("sit.jl")
include("hands.jl")
include("player.jl")

# import .BJCore
using PlayingCards
using Random
import UUIDs

export Dealer, Round

struct Dealer
    ID::UUIDs.UUID
    Name::String
    Hand::BJCore.Hand
    UpCard::PlayingCards.Card
    DownCard::PlayingCards.Card
end

mutable struct Round
    Shoe::BJCore.Shoe
    Players::Vector{Pair{SitStruct, Player}}
    nplayers::Int
    Sits::Int
    ActiveSits::Vector{SitStruct}
    function Round(Players, Shoe)

    end
end
end
