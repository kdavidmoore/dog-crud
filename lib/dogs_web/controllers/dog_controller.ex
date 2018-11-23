defmodule DogsWeb.DogController do
  use DogsWeb, :controller

  alias Dogs.Dog

  def index(conn, _params) do
    dogs = Dogs.list_dogs()
    render(conn, "index.html", dogs: dogs)
  end

  def show(conn, %{"id" => id}) do
    dog = Dogs.get_dog(id)
    render(conn, "show.html", dog: dog)
  end

  def new(conn, _params) do
    changeset = Dog.changeset(%Dog{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"dog" => dog}) do
    case Dogs.create_dog(dog) do
      {:ok, dog} ->
        conn
        |> put_flash(:info, "Dog Created")
        |> redirect(to: dog_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    dog = Dogs.get_dog(id)

    changeset = Dog.changeset(dog, %{})

    render(conn, "edit.html", changeset: changeset, dog_id: id)
  end

  def update(conn, %{"id" => id, "dog" => dog_params}) do
    dog = Dogs.get_dog(id)

    case Dogs.update_dog(dog, dog_params) do
      {:ok, dog} ->
        conn
        |> put_flash(:info, "Dog Updated")
        |> redirect(to: dog_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

end
