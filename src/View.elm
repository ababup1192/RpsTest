module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Messages exposing (..)
import Models exposing (Model, Game(..))
import Rps exposing (Hand(..), Result(..), fight)


view : Model -> Html Msg
view { game, you, enemy } =
    case game of
        Start ->
            input
                [ type_ "button"
                , onClick NextGame
                , value "ゲーム開始"
                ]
                []

        NowPlaying ->
            div [] hands

        Over ->
            let
                ye =
                    (toString you) ++ " VS " ++ (toString enemy)

                r =
                    result you enemy
            in
                div []
                    [ h1 [] [ text ye ]
                    , r
                    , input
                        [ type_ "button"
                        , onClick NextGame
                        , value "次のゲームへ"
                        ]
                        []
                    ]

        _ ->
            Debug.crash "Illegal state"


hands : List (Html Msg)
hands =
    [ Rock, Paper, Scissors ]
        |> List.map
            (\hand ->
                input
                    [ type_ "button"
                    , onClick <| SelectYourHand hand
                    , value <| toString hand
                    ]
                    []
            )


result : Hand -> Hand -> Html Msg
result you enemy =
    let
        r =
            Rps.fight you enemy
    in
        case r of
            Win ->
                h1 [ style [ ( "color", "red" ) ] ] [ text <| toString r ]

            Lose ->
                h1 [ style [ ( "color", "blue" ) ] ] [ text <| toString r ]

            Draw ->
                h1 [ style [ ( "color", "gray" ) ] ] [ text <| toString r ]
