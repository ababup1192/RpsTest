module Tests exposing (..)

import Test exposing (..)
import TestExp exposing (..)


-- Test target modules

import Rps exposing (..)


all : Test
all =
    describe "Rsp Test"
        [ "Win"
            => fight Rock Scissors
            === Win
        , "Lose"
            => fight Scissors Rock
            === Lose
        , "Draw"
            => fight Paper Paper
            === Draw
        ]
