module Model exposing (..)

import Browser
import Browser.Navigation as Navigation exposing (Key)
import Http exposing (Error)
import Url exposing (Protocol(..), Url)


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | PopulateDatabase
    | PopulateDatabaseResult (Result Error Bool)


type alias Model =
    { key : Key
    , url : Url.Url
    , populateResult : Maybe Bool
    }


defaultModel : Navigation.Key -> Url -> Model
defaultModel key url =
    Model key url Nothing
