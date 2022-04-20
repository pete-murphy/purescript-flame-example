module Main where

import Prelude

import Effect (Effect)
import Flame (Html, QuerySelector(..), Subscription)
import Flame.Application.NoEffects as FAN
import Flame.Html.Element as HE
import Flame.Html.Attribute as HA

type Model = Int
data Message = Increment | Decrement | Reset

update :: Model -> Message -> Model
update model = case _ of
  Increment -> model + 1
  Decrement -> model - 1
  Reset -> 0

view :: Model -> Html Message
view model = HE.main "main"
  [ HE.text $ show model
  , HE.button [ HA.onClick Increment ] "+"
  , HE.button [ HA.onClick Decrement ] "-"
  , HE.button [ HA.onClick Reset ] "reset"
  ]

main :: Effect Unit
main = FAN.mount_ (QuerySelector "body")
  { init: 0
  , view
  , update
  , subscribe: []
  }