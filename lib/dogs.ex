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
end
