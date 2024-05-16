module CardReplacement
export CardEvent

include("src/core.jl")

function CardEvent()
    hit = rand(1:pcards)
    if BJCore.deck[hit].first == "A"
        BJCore.deck[hit].first
    else
        return string(BJCore.deck[hit].second[1])
    end
end
end

# using StatsBase
# using Plots
# pyplot()

# N = 10^5
# frequency = countmap(cardEvent() for _ in 1:N)
# values_norm = values(frequency) ./ N
# f = [i for i in values(frequency)]
# P = f ./ sum(values(frequency))

# # using GLMakie
# using LaTeXStrings
# bar([keys(frequency)...], values_norm, title=L"\mathbf{20 retiradas}")

# using DataStructures
# N = 1 * 10^3
# frequency2 = [CardEvent() for _ in 1:N]
# anim = @animate for i = 1:5:N
#     f = counter(frequency2[1:i])
#     P = [j / sum(f) for j in values(f)]
#     title = "$i retiradas"
#     bar([keys(f)...], P, title=title)
# end

# gif(anim, "mygif.gif", fps=40)
