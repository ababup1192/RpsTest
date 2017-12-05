module Rps exposing (Result(..), Hand(..), fight, toHand)

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
            ((fromHand you - fromHand enemy) + 3) % 3
    in
        result r


fromHand : Hand -> Int
fromHand hand =
    case hand of
        Rock ->
            0

        Scissors ->
            1

        Paper ->
            2


toHand : Int -> Hand
toHand num =
    case num of
        0 ->
            Rock

        1 ->
            Scissors

        2 ->
            Paper

        _ ->
            Debug.crash "Illegal hand"


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
