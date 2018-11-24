defmodule Dogs do
  @moduledoc """
  Dogs keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Dogs.Repo
  alias Dogs.Dog

  def list_dogs do
    Repo.all(Dog)
  end

  def get_dog(id) do
    Repo.get(Dog, id)
  end

  @doc """
  Creates a Dog.

  ## Examples

      iex> create_dog(dog)
      {:ok, %Dog{}}

      iex> create_dog(dog)
      {:error, %Ecto.Changeset{}}

  """
  def create_dog(attrs \\ %{}) do
    result = %Dog{}
    |> Dog.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a Dog.

  ## Examples

      iex> update_dog(dog)
      {:ok, %Dog{}}

      iex> update_dog(dog)
      {:error, %Ecto.Changeset{}}

  """
  def update_dog(%Dog{} = dog, attrs) do
    dog
    |> Dog.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  (Bang) Deletes a Dog.
  """
  def delete_dog!(dog_id) do
    Repo.get!(Dog, dog_id) |> Repo.delete!
  end
end
