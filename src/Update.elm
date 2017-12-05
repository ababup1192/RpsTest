module Update exposing (..)

import Models exposing (Model, Game(..))
import Messages exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NextGame ->
            ( { model | game = NowPlaying }, Cmd.none )

        SelectHand hand ->
            ( { model | you = hand, game = Over }, Cmd.none )
