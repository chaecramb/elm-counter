module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Events exposing (onClick)

type alias Model
 = { counter : Int
  , incremented : Int
  , decremented : Int
  }

model : Model 
model = { counter = 0
  , incremented = 0
  , decremented = 0
  }


type Msg
  = Increment
  | Decrement

update : Msg -> Model -> Model
update msg model = 
  case msg of
    Increment -> 
      { model
       | counter = model.counter + 1
       , incremented = model.incremented + 1 
     }

    Decrement -> 
      { model
       | counter = model.counter - 1
       , decremented = model.decremented + 1 
     }


view : Model -> Html Msg
view model =
  div []
  [ button [ onClick Decrement ] [ text "-" ]
  , div [] [ text (toString model.counter) ]
  , button [ onClick Increment ] [ text "+" ]
  , h3 [] [ text ("Increment clicks: " ++ toString model.incremented) ]
  , h3 [] [ text ("Decrement clicks: " ++ toString model.decremented) ]
  ]

main =
  App.beginnerProgram 
    { model = model
    , view = view
    , update = update
    }