using StatsBase
using Plots;
pyplot();

deck = ["A" => [[1, 11], 4], "C2" => [2, 4], "C3" => [3, 4], "C4" => [4, 4], "C5" => [5, 4], "C6" => [6, 4], "C7" => [7, 4], "C8" => [8, 4], "C9" => [9, 4], "C10" => [10, 4], "CJ" => ["J", 4], "CQ" => ["Q", 4], "CK" => ["K", 4]]
cards = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
pcards = 13                       # possible cards

using DataStructures
function cardEventNR(n=1, dks=6, r=false)
    c = repeat(cards, 4 * dks) # 4 cards per number of decks per card-type
    hits = sample(c, n, replace=r)
    return hits
end

frequency3 = cardEventNR(312, 6)

anim3 = @animate for i = 1:(13*6*4)
    f = counter(frequency3[1:i])
    P = [j / sum(f) for j in values(f)]
    title = "$i retiradas"
    bar([keys(f)...], P, title=title)
end

gif(anim3, "mygif-noreplace.gif", fps=10)
