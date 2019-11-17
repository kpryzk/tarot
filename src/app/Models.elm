module Models exposing (..)

import Lorem
import Routes exposing (Route(HomeRoute))


type alias User =
    { email : String
    }


type alias Post =
    { id : String
    , title : String
    , body : String
    }


type alias Form =
    { email : String
    , password : String
    , passwordAgain : String
    , postTitle : String
    , postBody : String
    }


type alias Token =
    { accessToken : String
    , idToken : String
    , tokenType : String
    , expiresIn : Int
    }


type alias Model =
    { posts : List Post
    , form : Form
    , route : Route
    , user : WebData User
    , token : WebData Token
    , account : WebData ()
    }


initialModel : Model
initialModel =
    { posts = List.range 1 10 |> List.map toString |> List.map initialPost
    , user = NotAsked
    , form = initialForm
    , route = HomeRoute
    , token = NotAsked
    , account = NotAsked
    }


initialPost : String -> Post
initialPost id =
    { id = id
    , title = Lorem.sentence 4
    , body = Lorem.paragraphs 2 |> String.concat
    }


initialForm : Form
initialForm =
    { email = "", password = "", passwordAgain = "", postTitle = "", postBody = "" }
