module BlackJack
include("src/noreplace-histogram.jl")

function isA(event)
    if event == "A"
        true
    else
        false
    end
end

function isTens(event)
    if event == "10" || event == "Q" || event == "J" || event == "K"
        true
    else
        false
    end
end

N = 10^5
cnt = 0
for i in 1:N
    event = CNR.CardEventNR(3, 6)
    if (isA(event[1]) && isTens(event[3]) || isA(event[3]) && isTens(event[1]))
        cnt += 1
    end
end

P_BJ = cnt / N # => 0.0480
end
