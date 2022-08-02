module BlackJack
include("../noreplace-histogram.jl")
include("../constants/core.jl")
include("../counter_HiLo.jl")


# Help functions
function isCombination(f, g, e1, e2)
    if (f(e1) && g(e2)) || (f(e2) && g(e1))
        true
    else
        false
    end
end


# isBJ
function isBJ(e1, e2)
    isCombination(BJcore.isA, BJcore.isTens, e1, e2)
end


## CNR: Count with No Replacement
## BJcore: core of the Blackjack application.

function P_BJ(n=10^6)
    N = n
    cnt = 0
    for i in 1:N
        event = CNR.CardEventNR(3, 6)
        if isBJ(event[1], event[3])
            cnt += 1
        end
    end
    P_BJ = cnt / N # => ~0.0475
    print("Probability of BJ, at first hand: $(P_BJ)")
end
end
