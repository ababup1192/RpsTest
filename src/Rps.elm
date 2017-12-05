module Rps exposing (Result(..), Hand(..), fight)

import Debug


type Result
    = Win
    | Lose
    | Draw


type Hand
    = Rock
    | Paper
    | Scissors


fight : Hand -> Hand -> Result
fight you enemy =
    let
        r =
            ((handNum you - handNum enemy) + 3) % 3
    in
        result r


handNum : Hand -> Int
handNum hand =
    case hand of
        Rock ->
            0

        Scissors ->
            1

        Paper ->
            2


result : Int -> Result
result num =
    case num of
        2 ->
            Win

        1 ->
            Lose

        0 ->
            Draw

        _ ->
            Debug.crash "Illegal number"
