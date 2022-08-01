module BJcore

export deck, cards, pcards

const deck = ["A" => [[1, 11], 4], "C2" => [2, 4], "C3" => [3, 4], "C4" => [4, 4], "C5" => [5, 4], "C6" => [6, 4], "C7" => [7, 4], "C8" => [8, 4], "C9" => [9, 4], "C10" => [10, 4], "CJ" => ["J", 4], "CQ" => ["Q", 4], "CK" => ["K", 4]]
const cards = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
const pcards = 13                       # possible cards
