using BlackJack
using Test

@testset "Sits Struct manipulation" begin
    player = BlackJack.Game.Player("player 1", 1000.0)

    @testset "Player taking a sit" begin
        BlackJack.Game.newSit!(player, BlackJack.Game.SitStruct(1))
        @test length(player.Sits.dict) == 1
    end

    @testset "Player leaving a sit" begin
        BlackJack.Game.newSit!(player, BlackJack.Game.SitStruct(1))
        @test length(player.Sits.dict) == 1
    end
end
