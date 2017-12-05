module Models exposing (..)

import Rps exposing (..)


type Game
    = Start
    | NowPlaying
    | Over


type alias Model =
    { you : Hand, enemy : Hand, game : Game }


initialModel : Model
initialModel =
    { you = Rock, enemy = Rock, game = Start }
