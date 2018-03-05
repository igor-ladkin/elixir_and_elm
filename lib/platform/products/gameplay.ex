defmodule Platform.Products.Gameplay do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Accounts.Player
  alias Platform.Products.{Game, Gameplay}

  schema "gameplays" do
    field(:player_score, :integer, default: 0)

    belongs_to(:game, Game)
    belongs_to(:player, Player)

    timestamps()
  end

  @doc false
  def changeset(%Gameplay{} = gameplay, attrs) do
    gameplay
    |> cast(attrs, [:player_score])
    |> validate_required([:player_score])
  end
end
