module Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Card)


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
                    [ li [] [ a [ class "btn" ] [ text "Login" ] ]
                    , li [] [ a [ class "btn" ] [ text "Sign Up" ] ]
                    ]
                ]
            ]
        ]


landingBody : List Card -> Html msg
landingBody cards =
    main_ [ class "container" ]
        [ List.map cardCard cards
            |> div [ class "row" ]
        ]


cardCard : Card -> Html msg
cardCard card =
    div [ class "col s12 m6 l4" ]
        [ div [ class "card small hoverable grey lighten-4" ]
            [ div [ class "card-content" ]
                [ span [ class "card-title medium" ]
                    [ text <| "ID " ++ card.id ++ ": " ++ card.name ]
                , p [] [ text card.meaning_up ]
                ]
            ]
        ]
