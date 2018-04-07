defmodule DogsWeb.DogController do
  use DogsWeb, :controller
  alias Dogs

  def index(conn, _params) do
    dogs = Dogs.list_dogs()
    render conn, "index.html", dogs: dogs
  end

  def show(conn, %{"id" => id}) do
    dog = Dogs.get_dog(id)
    render conn, "show.html", dog: dog
  end

  def edit(conn, %{"id" => id}) do
    dog = Dogs.get_dog(id)
    render conn, "edit.html", dog: dog
  end
end
