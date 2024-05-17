module Game

# using Base: PartitionIterator
include("../constants/core.jl")
using .BJCore
import UUIDs

struct Sit
    ID::Int
end

struct Dealer
    ID::UUIDs.UUID
    Name::String
    Hand::BJCore.Hand
    UpCard::BJCore.Card
    DownCard::BJCore.Card
end

struct Player
    ID::UUIDs.UUID
    Name::String
    Hands::Vector{Sit => BJCore.Hand}
    Bank::Float64
    Sits::Vector{Sit}
    function Player(Name, Bank, Sits=[0], Hands=[])
        rng = MersenneTwister(1234);
        uuid = uuid4(rng)
        new(uuid, Name, Hands, Bank, Sits)
    end
end

mutable struct Round
    Shoe::BJCore.Shoe
    Players::Vector{Sit => Player}
    nplayers::Int
    Sits::Int
    ActiveSits::Vector{Sit}
    function Round(Players, Shoe)

    end
end


end
