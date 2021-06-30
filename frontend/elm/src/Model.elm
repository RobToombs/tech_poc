module Model exposing (..)

import Http exposing (Error)


type Msg
    = PopulateDatabase
    | PopulateDatabaseResult (Result Error Bool)


type alias Model =
    {}


defaultModel : Model
defaultModel =
    Model
