module HttpActions exposing (..)

import Http exposing (Body, Error, Expect, Header)
import Json.Decode as Decode
import Model exposing (Msg(..))


populateDbCmd : Cmd Msg
populateDbCmd =
    let
        url =
            "/api/populate-db"
    in
    Http.request <| createPutExpectEntity url Http.emptyBody PopulateDatabaseResult Decode.bool


createPutExpectEntity : String -> Http.Body -> (Result Error a -> msg) -> Decode.Decoder a -> { method : String, headers : List Header, url : String, body : Body, expect : Expect msg, timeout : Maybe Float, tracker : Maybe String }
createPutExpectEntity url body callBack decoder =
    { method = "PUT"
    , headers = []
    , url = url
    , body = body
    , expect = Http.expectJson callBack decoder
    , timeout = Nothing
    , tracker = Nothing
    }
