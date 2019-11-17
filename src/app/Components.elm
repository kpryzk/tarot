module Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing (..)
import Models exposing (Card, User)
import Routes exposing (..)


layout : Html msg -> Html msg -> Html msg
layout header main =
    div []
        [ header, main ]


authHeader : Html msg
authHeader =
    header []
        [ nav []
            [ div [ class "nav-wrapper container" ]
                [ ul [ class "right" ]
                    [ li [] [ a [ href <| path LoginRoute, class "btn" ] [ text "Login" ] ]
                    , li [] [ a [ href <| path SignUpRoute, class "btn" ] [ text "Sign Up" ] ]
                    ]
                ]
            ]
        ]


landingBody : List Card -> Html Msg
landingBody cards =
    main_ [ class "container" ]
        [ List.map cardCard cards
            |> div [ class "row" ]
        ]


cardCard : Card -> Html Msg
cardCard card =
    div [ class "col s12 m6 l4" ]
        [ div [ onClick <| UpdateRoute <| ReadPostRoute card.id, class "card small hoverable grey lighten-4" ]
            [ div [ class "card-content" ]
                [ span [ class "card-title medium" ]
                    [ text card.name ]
                , p [] [ text <| String.left 300 card.meaning_up ]
                ]
            ]
        ]


readCardBody : Card -> Html msg
readCardBody card =
    main_ [ class "container" ]
        [ div [ class "row" ]
            [ div [ class "col l6 offset-l3" ]
                [ h1 [] [ text <| "ID " ++ card.id ++ ": " ++ card.name ]
                , List.repeat 10 card.meaning_up |> List.map (\par -> p [] [ text par ]) |> div []
                ]
            ]
        ]


error : a -> Html msg
error a =
    main_ [ class "container" ] [ text <| toString a ]


userHeader : User -> Html msg
userHeader user =
    header []
        [ nav []
            [ div [ class "nav-wrapper container" ]
                [ a [ class "btn" ] [ text "New Card" ]
                , ul [ class "right" ]
                    [ li [] [ text user.email ]
                    , li [] [ a [ class "btn" ] [ text "Logout" ] ]
                    ]
                ]
            ]
        ]


createCardBody : Html msg
createCardBody =
    main_ [ class "container " ]
        [ div [ class "row" ]
            [ Html.form [ class "col s12 m8 offset-m2" ]
                [ div [ class "input-field" ] [ input [ placeholder "Card Title", type_ "text" ] [] ]
                , div [ class "input-field" ] [ textarea [ placeholder "Enter card here..." ] [] ]
                , a [ class "btn right" ] [ text "Create" ]
                ]
            ]
        ]


emailInput : Html msg
emailInput =
    div [ class "input-field" ]
        [ i [ class "material-icons prefix" ] [ text "email" ]
        , input [ placeholder "Email", type_ "text" ] []
        ]


passwordInput : Html msg
passwordInput =
    div [ class "input-field" ]
        [ i [ class "material-icons prefix" ] [ text "lock" ]
        , input [ placeholder "Password", type_ "password" ] []
        ]


passwordAgain : Html msg
passwordAgain =
    div [ class "input-field" ]
        [ i [ class "material-icons prefix" ] [ text "lock" ]
        , input [ placeholder "Password Again", type_ "password" ] []
        ]


authentication : List (Html msg) -> Html msg
authentication body =
    main_ [ class "container " ]
        [ div [ class "full-height row valign-wrapper" ]
            [ Html.form [ class "col s12 m4 offset-m4" ]
                body
            ]
        ]


login : Html msg
login =
    authentication
        [ emailInput
        , passwordInput
        , a [ class "btn right" ] [ text "Login" ]
        ]


signUp : Html msg
signUp =
    authentication
        [ emailInput
        , passwordInput
        , passwordAgain
        , a [ class "btn right" ] [ text "Sign Up" ]
        ]
