module Models exposing (..)

import Lorem


type alias Card =
    { id : String
    , name : String
    , imageUrl : String
    , meaning_rev : String
    , meaning_up : String
    }


type alias User =
    { email : String }


type alias Model =
    { cards : List Card
    , user : User
    }


initialCard : String -> Card
initialCard id =
    { id = id
    , name = Lorem.sentence 4
    , imageUrl = Lorem.paragraphs 2 |> String.concat
    , meaning_rev = Lorem.sentence 4
    , meaning_up = Lorem.sentence 4
    }


initialModel : Model
initialModel =
    { cards = List.range 1 10 |> List.map toString |> List.map initialCard
    , user = { email = "email@gmail.com" }
    }
