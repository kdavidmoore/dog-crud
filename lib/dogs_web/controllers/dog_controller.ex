defmodule DogsWeb.DogController do
  use DogsWeb, :controller

  alias Dogs.Dog
  alias Dogs.Repo

  def index(conn, _params) do
    dogs = Dogs.list_dogs()

    render(conn, "index.html", dogs: dogs)
  end

  def show(conn, %{"id" => dog_id}) do
    dog = Dogs.get_dog(dog_id)

    render(conn, "show.html", dog: dog)
  end

  def new(conn, _params) do
    changeset = Dog.changeset(%Dog{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"dog" => dog}) do
    case Dogs.create_dog(dog) do
      {:ok, _dog} ->
        conn
        |> put_flash(:info, "Dog Created")
        |> redirect(to: dog_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => dog_id}) do
    dog = Dogs.get_dog(dog_id)

    changeset = Dog.changeset(dog, %{})

    render(conn, "edit.html", changeset: changeset, dog: dog)
  end

  def update(conn, %{"id" => dog_id, "dog" => dog_params}) do
    dog = Dogs.get_dog(dog_id)

    case Dogs.update_dog(dog, dog_params) do
      {:ok, _dog} ->
        conn
        |> put_flash(:info, "Dog Updated")
        |> redirect(to: dog_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset, dog: dog)
    end
  end

  def delete(conn, %{"id" => dog_id}) do
    Repo.get!(Dog, dog_id) |> Repo.delete!

    conn
    |> put_flash(:info, "Dog Deleted")
    |> redirect(to: dog_path(conn, :index))
  end
end
