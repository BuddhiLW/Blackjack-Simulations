using BlackJack
using PlayingCards
using Test

@testset "Player Struct" begin

    player = BlackJack.Game.Player("player 1", 1000.0)

    @testset "Creation" begin
        @test player.Name == "player 1"
        @test player.Bank == 1000.0
    end

    @testset "New hand" begin
        push!(player.Hands.Sits, BlackJack.Game.SitStruct(1) => BlackJack.Game.BJCore.Hand([PlayingCards.A♡, PlayingCards.K♠]))
        @test BlackJack.Game.get(player.Hands.Sits,1).Cards == PlayingCards.Card[A♡, K♠]
    end
end
