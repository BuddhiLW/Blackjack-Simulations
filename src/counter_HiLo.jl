module HiLo
using Base: stacktrace_contract_userdir
include("noreplace-histogram.jl")
include("constants/core.jl")

# Implement background-count setup for a simulation
#

# DecksWOC: Decks WithOut Cards
using Shuffle
function DecksWOC(n=1, preferences::Vector{Pair{String,Int64}}=[], deck=BJcore.cards)
    cards = shuffle!(repeat(deck, 4 * n))

    if preferences == []
        return cards
    else
        for i in 1:length(preferences)
            card = preferences[1].first
            quantity = preferences[1].second
            popfirst!(preferences)

            p = count((c) -> (c == card), cards)
            q = p - quantity
            if q <= 0
                filter!((c) -> (c != card), cards)
            else
                filter!((c) -> (c != card), cards)
                cards = shuffle!(vcat(cards, repeat([card], q)))
            end
        end
        return cards
    end
end

end
