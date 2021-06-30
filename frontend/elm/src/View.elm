module View exposing (..)

import Bootstrap.Button as Button
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Browser
import Html exposing (Html, text)
import Model exposing (Model, Msg(..))
import Url


view : Model -> Browser.Document Msg
view model =
    { title = "Elm Application"
    , body = [ createPage model ]
    }


createPage : Model -> Html Msg
createPage model =
    Grid.containerFluid []
        [ CDN.stylesheet
        , Grid.row []
            [ Grid.col []
                [ text ("The current URL ist: " ++ Url.toString model.url) ]
            ]
        , Grid.row []
            [ Grid.col []
                [ populateResultMessage model.populateResult ]
            ]
        , Grid.row []
            [ Grid.col []
                [ populateDatabaseButton ]
            ]
        ]


populateDatabaseButton : Html Msg
populateDatabaseButton =
    Button.button
        [ Button.primary
        , Button.onClick PopulateDatabase
        ]
        [ text "Populate!" ]


populateResultMessage : Maybe Bool -> Html Msg
populateResultMessage result =
    let
        message =
            case result of
                Just populate ->
                    if populate then
                        "Great Success!"

                    else
                        "Failed to populate DB."

                Nothing ->
                    "Try populating the DB!"
    in
    text message
