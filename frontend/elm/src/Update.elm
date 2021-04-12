module Update exposing (..)

import Model exposing (Model)


update : msg -> Model -> ( Model, Cmd msg )
update msg model =
    ( model, Cmd.none )
