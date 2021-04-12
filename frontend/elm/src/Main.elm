module Main exposing (..)

import Browser
import Model exposing (Model, defaultModel)
import Update exposing (update)
import View exposing (view)


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : () -> ( Model, Cmd msg )
init _ =
    ( defaultModel, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none
