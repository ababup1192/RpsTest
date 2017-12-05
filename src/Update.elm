module Update exposing (..)

import Models exposing (Model, Game(..))
import Messages exposing (..)
import Random
import Rps


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NextGame ->
            ( { model | game = NowPlaying }, Cmd.none )

        SelectYourHand hand ->
            ( { model | you = hand, game = Over }, Random.generate SelectEnemyHand (Random.int 0 2) )

        SelectEnemyHand num ->
            ( { model | enemy = Rps.toHand num }, Cmd.none )
