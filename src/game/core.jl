module Game

include("../constants/core.jl")
import .BJCore
using PlayingCards
using Random
import UUIDs

export SitStruct, Dealer, Player, Round, newSit!, leaveSit!

struct SitStruct
    ID::Int64
end

struct SitsStruct
    dict::Set{SitStruct}
    function SitsStruct()
        new(Set())
    end
    function SitsStruct(sit::SitStruct)
        new(Set(sit))
    end
    function SitsStruct(set::Set{SitStruct})
        new(set)
    end
end
Base.push!(sits::SitsStruct, sit::SitStruct) = push!(sits.dict, sit)
Base.pop!(sits::SitsStruct, sit::SitStruct) = pop!(sits.dict, sit)

struct Dealer
    ID::UUIDs.UUID
    Name::String
    Hand::BJCore.Hand
    UpCard::PlayingCards.Card
    DownCard::PlayingCards.Card
end

struct Hands
    Sits::Dict{SitStruct, BJCore.Hand}
    function Hands(Sits)
        new(Sits)
    end
    function Hands()
        new(Dict())
    end
end
Base.push!(hands::Hands, sit::SitStruct, hand::BJCore.Hand) = push!(hands.Sits, sit => hand)
Base.pop!(hands::Hands, sit::SitStruct) = pop!(hands.Sits, sit)
function get(sits::Dict{SitStruct, BJCore.Hand}, id::Int)
    Base.get(sits, SitStruct(id), BJCore.Hand())
end

struct Player
    ID::UUIDs.UUID
    Name::String
    Bank::Float64
    Hands::Hands
    Sits::SitsStruct
    function Player(Name::String,
                    Bank::Float64,
                    Sits=SitsStruct(),    # SitStruct(0)
                    Hands=Hands())        # Dict(SitStruct(0) => BJCore.Hand()))
        # rng = Random.MersenneTwister(1234);
        uuid = UUIDs.uuid4() # rng
        new(uuid, Name, Bank, Hands, Sits)
    end
end

function Base.show(io::IO, obj::Player)
    println(io, "Player: ", obj.Name, ",\nBank: ", obj.Bank, ",\nPlaying hands: ", obj.Hands.Sits)
end

function newSit!(player::Player, sit::SitStruct)
    push!(player.Sits, sit)
    push!(player.Hands.Sits, sit => BJCore.Hand())
end

function leaveSit!(player::Player, sit::SitStruct)
    pop!(player.Hands.Sits, sit)
    pop!(player.Sits, sit)
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
