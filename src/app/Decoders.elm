module Decoders exposing (..)

import Json.Decode as Decoder
import Json.Decode.Pipeline as Pipeline
import Models exposing (Token, User)


decodeToken : Decoder.Decoder Token
decodeToken =
    Pipeline.decode Token
        |> Pipeline.required "access_token" Decoder.string
        |> Pipeline.required "id_token" Decoder.string
        |> Pipeline.required "token_type" Decoder.string
        |> Pipeline.required "expires_in" Decoder.int


decodeUser : Decoder.Decoder User
decodeUser =
    Pipeline.decode User
        |> Pipeline.required "email" Decoder.string
