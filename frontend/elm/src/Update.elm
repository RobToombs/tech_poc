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
                    let
                        updatedModel =
                            { model | populateResult = Just populated }
                    in
                    ( updatedModel, Cmd.none )

                Err err ->
                    let
                        updatedModel =
                            { model | populateResult = Just False }
                    in
                    ( updatedModel, Cmd.none )
