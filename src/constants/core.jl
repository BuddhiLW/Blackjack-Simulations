module BJcore

export deck, cards, pcards

const deck = ["A" => [[1, 11], 4], "C2" => [2, 4], "C3" => [3, 4], "C4" => [4, 4], "C5" => [5, 4], "C6" => [6, 4], "C7" => [7, 4], "C8" => [8, 4], "C9" => [9, 4], "C10" => [10, 4], "CJ" => ["J", 4], "CQ" => ["Q", 4], "CK" => ["K", 4]]
const cards = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
const pcards = 13                       # possible cards


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

function is2_6(event)
    if event == "2" || event == "3" || event == "4" || event == "5" || event == "6"
        true
    else
        false
    end
end

function CountNegative(event)
    return count(i -> (isTens(i) || isA(i)), event)
end

function CountPositive(event)
    return count(i -> (is2_6(i)), event)
end
end
