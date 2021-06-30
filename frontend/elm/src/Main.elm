module Main exposing (..)

import Browser
import Browser.Navigation as Navigation
import Model exposing (Model, Msg(..), defaultModel)
import Update exposing (update)
import Url
import View exposing (view)


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


init : () -> Url.Url -> Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    ( defaultModel key url, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
