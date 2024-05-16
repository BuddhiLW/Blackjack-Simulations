module BJCore
import Base: ==


export A, C2, C3, C4, C5, C6, C7, C8, C9, C10, CJ, Card, Deck, NewDeck, Hand, isA, isTens, is2_6, CountPositive, CountNegative, CardType

struct Card
    Symbol::String
    Value::Vector{Int}
end

# Define a parametric struct for card types
struct CardType{T<:Card}
    card::T
end

@generated function ≂(x, y)
    if !isempty(fieldnames(x)) && x == y
        mapreduce(n -> :(x.$n ≂ y.$n), (a,b)->:($a && $b), fieldnames(x))
    else
        :(x == y)
    end
end

function ==(a::T, b::T) where T <: CardType
    if !isempty(fieldnames(x)) && x == y
        mapreduce(n -> :(x.$n ≂ y.$n), (a,b)->:($a && $b), fieldnames(x))
    else
        :(x == y)
    end
end

struct A
    card::Card
    function A()
        new(Card("A", [1,11]))
    end
end

struct C2
    card::Card
    function C2()
        new(Card("C2", [2]))
    end
end

struct C3
    card::Card
    function C3()
        new(Card("C3", [3]))
    end
end

struct C4
    card::Card
    function C4()
        new(Card("C4", [4]))
    end
end

struct C5
    card::Card
    function C5()
        new(Card("C5", [5]))
    end
end

struct C6
    card::Card
    function C6()
        new(Card("C6", [6]))
    end
end

struct C7
    card::Card
    function C7()
        new(Card("C7", [7]))
    end
end


struct C8
    card::Card
    function C8()
        new(Card("C8", [8]))
    end
end

struct C9
    card::Card
    function C9()
        new(Card("C9", [9]))
    end
end

struct C10
    card::Card
    function C10()
        new(Card("C10", [10]))
    end
end

struct CJ
    card::Card
    function CJ()
        new(Card("CJ", [10]))
    end
end

struct CQ
    card::Card
    function CQ()
        new(Card("CQ", [10]))
    end
end

struct CK
    card::Card
    function CK()
        new(Card("CK", [10]))
    end
end

const deck = ["A" => [[1, 11], 4], "C2" => [2, 4], "C3" => [3, 4], "C4" => [4, 4], "C5" => [5, 4], "C6" => [6, 4], "C7" => [7, 4], "C8" => [8, 4], "C9" => [9, 4], "C10" => [10, 4], "CJ" => ["J", 4], "CQ" => ["Q", 4], "CK" => ["K", 4]]
const cards = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
const pcards= 13 # possible cards

struct Deck
    Cards::Dict{Pair{String, Pair{Card,Int}}}
end

mutable struct NewDeck
    deck::Deck
    n::Int
    function NewDeck(n=1)
        Dict(["A" => A() => 4*n, "2" => C2() => 4*n, "3" => C3() => 4*n,
         "4" => C4() => 4*n, "5" => C5()=> 4*n, "6" => C6()=> 4*n,
         "7" => C7()=> 4*n, "8" => C8()=> 4*n, "9" => C9()=> 4*n,
         "10" => C10()=> 4*n, "J" => CJ()=> 4*n, "Q" => CQ()=> 4*n,
         "K" => CK()=> 4*n])
    end
end

mutable struct Shoe
    # deck::Deck
    n::Int
    function Shoe(n)
        # repeat([NewDeck() for i in 1:n], inner = 1)
        NewDeck(n)
    end
end

mutable struct Hand
    InitialCards::Pair{Card, Card}
    Cards::Array{Card}
    Value::Int
    function Hand(InitialCards)
        # Value = sum(InitialCards)
    end
end


function sum(hand::Hand)
    total_value = 0

    if A() in hand.Cards
    end

    for card in hand.Cards
        if card.Symbol == "A"
            if hand.Value + 11 <= 21
                hand.Value += 11
            else
                hand.Value += 1
            end
        else
            total_value += card.Value
        end
    end

    return total_value
end

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


    # f = fieldnames(T)
    # getfield.(Ref(a),f) == getfield.(Ref(b),f)


# Define a custom == function for CardType instances
# function ==(a::CardType, b::CardType)
#     return a.card == b.card
# end
