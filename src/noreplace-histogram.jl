module CNR

include("constants/core.jl")
using .BJCore
export cardEventNR


using StatsBase
using DataStructures

function CardEventNR(n=1, dks=6, r=false)
    c = repeat(BJCore.cards, 4 * dks) # 4 cards per number of decks per card-type
    hits = sample(c, n, replace=r)
    return hits
end
end

# using Plots
# pyplot()

# frequency3 = cardEventNR(312, 6)

# anim3 = @animate for i = 1:(13*6*4)
#     f = counter(frequency3[1:i])
#     P = [j / sum(f) for j in values(f)]
#     title = "$i retiradas"
#     bar([keys(f)...], P, title=title)
# end

# gif(anim3, "mygif-noreplace.gif", fps=10)
