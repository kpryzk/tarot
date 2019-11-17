module Pages exposing (..)

import Components exposing (..)
import Html exposing (Html)
import Messages exposing (Msg)
import Models exposing (..)
import Routes exposing (..)


landing : Model -> Html Msg
landing model =
    Maybe.map userHeader model.user
        |> Maybe.withDefault authHeader
        |> flip layout (landingBody model.cards)


view : Model -> Html Msg
view model =
    case model.route of
        HomeRoute ->
            landing model

        ReadPostRoute id ->
            readCard id model

        CreatePostRoute ->
            createCard model

        LoginRoute ->
            login model

        SignUpRoute ->
            signUp model

        ErrorRoute ->
            error "404 Not Found"


readCard : String -> Model -> Html msg
readCard id model =
    case List.head <| List.filter (\card -> card.id == id) model.cards of
        Just card ->
            Maybe.map userHeader model.user
                |> Maybe.withDefault authHeader
                |> flip layout (readCardBody card)

        Nothing ->
            error "404 Not Found"


createCard : Model -> Html msg
createCard model =
    case model.user of
        Just user ->
            layout (userHeader user) createCardBody

        Nothing ->
            error "404 Not Found"


login : Model -> Html msg
login model =
    Components.login


signUp : Model -> Html msg
signUp model =
    Components.signUp


error : a -> Html msg
error err =
    Components.error err
