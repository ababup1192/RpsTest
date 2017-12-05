module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Messages exposing (..)
import Models exposing (Model, Game(..))
import Rps exposing (Hand(..))


view : Model -> Html Msg
view { game } =
    case game of
        Start ->
            input
                [ type_ "button"
                , onClick NextGame
                , value "ゲーム開始"
                ]
                []

        NowPlaying ->
            input
                [ type_ "button"
                , onClick <| SelectHand Rock
                , value "Rock"
                ]
                []

        Over ->
            input
                [ type_ "button"
                , onClick NextGame
                , value "次のゲームへ"
                ]
                []
