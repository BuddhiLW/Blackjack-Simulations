using BlackJack
using PlayingCards
using Test

shoe = BlackJack.Shoe(4)
hand = BlackJack.Hand(BlackJack.BJCore.pop!(shoe.Cards,2))

@testset "Card Values -- HiLo" begin
    @testset "Card Values, Negative -- HiLo" begin
        @test BlackJack.BJCore.Count([PlayingCards.Card(10,♢)]) == -1
        @test BlackJack.BJCore.Count([PlayingCards.J♢]) == -1
        @test BlackJack.BJCore.Count([PlayingCards.Q♢]) == -1
        @test BlackJack.BJCore.Count([PlayingCards.K♢]) == -1
        @test BlackJack.BJCore.Count([PlayingCards.A♢]) == -1
    end
    @testset "Card Values, Positive -- HiLo" begin
        @test BlackJack.BJCore.Count([PlayingCards.Card(2,♢)]) == 1
        @test BlackJack.BJCore.Count([PlayingCards.Card(3,♢)]) == 1
        @test BlackJack.BJCore.Count([PlayingCards.Card(4,♢)]) == 1
        @test BlackJack.BJCore.Count([PlayingCards.Card(5,♢)]) == 1
        @test BlackJack.BJCore.Count([PlayingCards.Card(6,♢)]) == 1
    end
end

@testset "Shoe running count -- HiLo" begin
    @test BlackJack.BJCore.RunningCount(shoe) == BlackJack.BJCore.Count(hand.Cards)
end

hand2 = BlackJack.Hand([PlayingCards.Card(10,♢), PlayingCards.A♢])
@testset "Test Hand struct" begin
    @test hand2.Cards == [PlayingCards.Card(10,♢), PlayingCards.A♢]
    @test hand2.Value == 21
end
