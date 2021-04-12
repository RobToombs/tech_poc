module View exposing (..)

import Html exposing (Html, div, text)
import Model exposing (Model)


view : Model -> Html msg
view model =
    div [] [ text "Hello There." ]
