using StatsBase
using Plots;
pyplot();

deck = ["A" => [[1, 11], 4], "C2" => [2, 4], "C3" => [3, 4], "C4" => [4, 4], "C5" => [5, 4], "C6" => [6, 4], "C7" => [7, 4], "C8" => [8, 4], "C9" => [9, 4], "C10" => [10, 4], "CJ" => ["J", 4], "CQ" => ["Q", 4], "CK" => ["K", 4]]
cards = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
pcards = 13                       # possible cards

function cardEvent()
    hit = rand(1:pcards)
    if deck[hit].first == "A"
        deck[hit].first
    else
        return string(deck[hit].second[1])
    end
end

# N = 10^5
# frequency = countmap(cardEvent() for _ in 1:N)
# values_norm = values(frequency) ./ N
# f = [i for i in values(frequency)]
# P = f ./ sum(values(frequency))

# # using GLMakie
# using LaTeXStrings
# bar([keys(frequency)...], values_norm, title=L"\mathbf{20 retiradas}")

using DataStructures
N = 1 * 10^3
frequency2 = [cardEvent() for _ in 1:N]
anim = @animate for i = 1:5:N
    f = counter(frequency2[1:i])
    P = [j / sum(f) for j in values(f)]
    title = "$i retiradas"
    bar([keys(f)...], P, title=title)
end

gif(anim, "mygif.gif", fps=40)
