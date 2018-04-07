defmodule Dogs.Repo.Migrations.AlterDogYearField do
  use Ecto.Migration

  def change do
    alter table("dogs") do
      modify :year_of_origin, :string
    end
  end
end
