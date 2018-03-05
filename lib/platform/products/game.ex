defmodule Platform.Products.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Accounts.Player
  alias Platform.Products.Gameplay

  schema "games" do
    field(:description, :string)
    field(:featured, :boolean, default: false)
    field(:thumbnail, :string)
    field(:title, :string)

    many_to_many(:players, Player, join_through: Gameplay)

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:description, :featured, :thumbnail, :title])
    |> validate_required([:description, :featured, :thumbnail, :title])
  end
end
