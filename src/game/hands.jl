# import .BJCore
export Hands

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
