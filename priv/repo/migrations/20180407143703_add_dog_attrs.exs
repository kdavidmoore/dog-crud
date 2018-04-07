defmodule Dogs.Repo.Migrations.AddDogAttrs do
  use Ecto.Migration

  def change do
    alter table(:dogs) do
      add :country_of_origin, :string
      add :year_of_origin, :integer
      add :height_in, :string
      add :weight_in, :string
      add :coat, :string
      add :color, :string
      add :life_exp, :string 
    end
  end
end
