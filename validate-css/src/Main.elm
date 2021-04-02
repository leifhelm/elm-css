port module Main exposing (main)

import PropertiesPhantom

main : Platform.Program () Model Msg
main =
    Platform.worker
        { init = init
        , update = update
        , subscriptions = subscriptions
        }


port cli__send : String -> Cmd msg


type Model
    = Model


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model, cli__send PropertiesPhantom.allToString )


type Msg
    = Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( Model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
