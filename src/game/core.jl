module Game

# using Base: PartitionIterator
include("../constants/core.jl")
import .BJCore
using PlayingCards
using Random
import UUIDs

export SitStruct, Dealer, Player, Round

struct SitStruct
    ID::Int64
end

struct Dealer
    ID::UUIDs.UUID
    Name::String
    Hand::BJCore.Hand
    UpCard::PlayingCards.Card
    DownCard::PlayingCards.Card
end

# struct SitHand
#     Sit::Dict{SitStruct, BJCore.Hand}
#     function SitHand(i::Int)
#         new(Dict(SitStruct(i) => BJCore.Hand()))
#     end
#     function SitHand(d::Dict{SitStruct, BJCore.Hand})
#         new(d)
#     end
#     function get(i::Int)
#         Base.get(Sit, SitStruct(i), BJCore.Hand())
#     end
# end
# abstract type AbstractHands <: Dict{SitStruct, BJCore.Hand} end

struct Hands
    Sits::Dict{SitStruct, BJCore.Hand}
    function Hands(Sits)
        new(Sits)
    end
end

function get(sits::Dict{SitStruct, BJCore.Hand}, id::Int)
    Base.get(sits, SitStruct(id), BJCore.Hand())
end

struct Player
    ID::UUIDs.UUID
    Name::String
    Hands::Hands
    Bank::Float64
    Sits::Vector{SitStruct}
    function Player(Name,
                    Bank,
                    Sits=[SitStruct(0)],
                    Hands=Hands(Dict(SitStruct(0) => BJCore.Hand())))
        rng = Random.MersenneTwister(1234);
        uuid = UUIDs.uuid4(rng)
        new(uuid, Name, Hands, Bank, Sits)
    end
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
