module View exposing (..)

import Bootstrap.Button as Button
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Html exposing (Html, div, text)
import Model exposing (Model, Msg(..))


view : Model -> Html Msg
view model =
    Grid.containerFluid []
        [ CDN.stylesheet
        , Grid.row []
            [ Grid.col []
                [ text "Hello There." ]
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
