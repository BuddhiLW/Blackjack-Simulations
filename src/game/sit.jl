export SitStruct, SitsStruct

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
