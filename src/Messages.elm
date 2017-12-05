module Messages exposing (..)

import Rps exposing (Hand)


type Msg
    = NextGame
    | SelectYourHand Hand
    | SelectEnemyHand Int
