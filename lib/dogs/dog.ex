defmodule Dogs.Dog do
  use Ecto.Schema
  import Ecto.Changeset


  schema "dogs" do
    field :name, :string
    field :photo, :string
    field :country_of_origin, :string
    field :year_of_origin, :string
    field :height_in, :string
    field :weight_lbs, :string
    field :coat, :string
    field :color, :string
    field :life_exp, :string

    timestamps()
  end

  @doc false
  def changeset(dog, attrs) do
    dog
    |> cast(attrs, [:name, :photo, :country_of_origin, :year_of_origin, :height_in, :weight_lbs, :coat, :color, :life_exp])
    |> validate_required([:name, :photo])
  end
end
