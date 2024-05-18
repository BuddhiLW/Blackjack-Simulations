using BlackJack
using Test

println("Testing...")

@testset "Example tests" begin
    @testset "Playing Cards package tests" begin
        include("cards_tests.jl")
    end

    @testset "Player struct and instantiation" begin
        include("player_tests.jl")
    end
end

## Testset example, from the docs:
# @testset "Foo Tests" begin
#     @testset "Animals" begin
#         @testset "Felines" begin
#             @test foo("cat") == 9
#         end
#         @testset "Canines" begin
#             @test foo("dog") == 9
#         end
#     end
#     @testset "Arrays" begin
#         @test foo(zeros(2)) == 4
#         @test foo(fill(1.0, 4)) == 15
#     end
# end
