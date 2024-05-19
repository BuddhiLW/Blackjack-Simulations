# import .BJCore
import UUIDs

# include("hands.jl")
# include("sit.jl")

export Player, newSit!, leaveSit!

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
