module BlackJack
include("noreplace-histogram.jl")
include("constants/core.jl")

N = 10^6
cnt = 0
for i in 1:N
    event = CNR.CardEventNR(3, 6)
    if (BJcore.isA(event[1]) && BJcore.isTens(event[3]) || BJcore.isA(event[3]) && BJcore.isTens(event[1]))
        cnt += 1
    end
end

P_BJ = cnt / N # => ~0.0475
print("Probability of BJ, at first hand: $(P_BJ)")
end
