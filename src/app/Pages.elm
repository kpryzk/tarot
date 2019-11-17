module Pages exposing (..)

import Components exposing (..)
import Html exposing (Html)
import Models exposing (..)


landing : Model -> Html msg
landing model =
    layout authHeader <| landingBody model.cards
