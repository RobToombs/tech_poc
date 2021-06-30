module Update exposing (..)

import Browser
import Browser.Navigation as Nav
import HttpActions exposing (populateDbCmd)
import Model exposing (Model, Msg(..))
import Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url }, Cmd.none )

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
