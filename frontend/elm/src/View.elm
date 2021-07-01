module View exposing (..)

import Bootstrap.Button as Button
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Utilities.Spacing exposing (mx1, mx5, my2)
import Browser
import Html exposing (Html, text)
import Html.Attributes exposing (href, target)
import Model exposing (Model, Msg(..))


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
                [ populateDatabaseButton, backToLoginScreenButton ]
            ]
        , Grid.row []
            [ Grid.col []
                [ populateResultMessage model.populateResult ]
            ]
        ]


backToLoginScreenButton : Html Msg
backToLoginScreenButton =
    Button.linkButton
        [ Button.roleLink
        , Button.attrs [ mx1, my2, href "/", target "_self" ]
        ]
        [ text "Back To Login" ]


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
