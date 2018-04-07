defmodule Dogs.Repo.Migrations.AlterDogAttr do
  use Ecto.Migration

  def change do
    rename table("dogs"), :weight_in, to: :weight_lbs
  end
end
