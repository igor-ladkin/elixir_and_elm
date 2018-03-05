module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { gamesList : List Game
    , displayGameList : Bool
    }


type alias Game =
    { gameTitle : String
    , gameDescription : String
    }


initialModel : Model
initialModel =
    { gamesList =
        [ { gameTitle = "Platform Game", gameDescription = "Platform game example." }
        , { gameTitle = "Adventure Game", gameDescription = "Adventure game example." }
        ]
    , displayGameList = False
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE


type Msg
    = DisplayGamesList
    | HideGamesList


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DisplayGamesList ->
            ( { model | displayGameList = True }, Cmd.none )

        HideGamesList ->
            ( { model | displayGameList = False }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [ class "games-section" ] [ text "Games" ]
        , button [ class "btn btn-success", onClick DisplayGamesList ] [ text "Display Games List" ]
        , button [ class "btn btn-danger ", onClick HideGamesList ] [ text "Hide Games List" ]
        , if model.displayGameList then
            gamesIndex model
          else
            div [] []
        ]


gamesIndex : Model -> Html msg
gamesIndex model =
    div [ class "games-index" ] [ gamesList model.gamesList ]


gamesList : List Game -> Html msg
gamesList games =
    ul [ class "games-list" ] (List.map gamesListItem games)


gamesListItem : Game -> Html msg
gamesListItem game =
    li [ class "game-itme" ]
        [ strong [] [ text game.gameTitle ]
        , p [] [ text game.gameDescription ]
        ]
