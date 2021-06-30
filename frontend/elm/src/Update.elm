module Update exposing (..)

import HttpActions exposing (populateDbCmd)
import Model exposing (Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PopulateDatabase ->
            ( model, populateDbCmd )

        PopulateDatabaseResult result ->
            case result of
                Ok populated ->
                    ( model, Cmd.none )

                Err err ->
                    ( model, Cmd.none )
