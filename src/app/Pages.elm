module Pages exposing (..)

import Components exposing (..)
import Html exposing (Html)
import Models exposing (..)


landing : Model -> Html msg
landing model =
    layout authHeader <| landingBody model.cards


readCard : String -> Model -> Html msg
readCard id model =
    case List.head <| List.filter (\card -> card.id == id) model.cards of
        Just card ->
            layout authHeader <| readCardBody card

        Nothing ->
            error "404 Not Found"


createCard : Model -> Html msg
createCard model =
    layout (userHeader model.user) createCardBody


error : a -> Html msg
error err =
    Components.error err
