module Main exposing (..)

import Html exposing (program)
import Models exposing (initialModel, Model)
import Messages exposing (..)
import View exposing (view)
import Update exposing (update)


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
