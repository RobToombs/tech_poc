module Model exposing (..)

import Http exposing (Error)


type Msg
    = PopulateDatabase
    | PopulateDatabaseResult (Result Error Bool)


type alias Model =
    { populateResult : Maybe Bool }


defaultModel : Model
defaultModel =
    Model Nothing
