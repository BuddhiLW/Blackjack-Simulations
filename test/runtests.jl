using BlackJack
using Test

println("Testing...")

@testset "Example tests" begin
    @testset "Playing Cards package tests" begin
        include("cards_tests.jl")
    end

    @testset "Player: basis struct" begin
        include("player_tests.jl")
    end

    @testset "Player: Sit structs interaction" begin
        include("sit_tests.jl")
    end
end
