defmodule DogsWeb.Router do
  use DogsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DogsWeb do
    pipe_through :browser # Use the default browser stack

    # get "/", DogController, :index
    # resources "/dogs", DogController
    resources "/", DogController
  end

  # Other scopes may use custom stacks.
  # scope "/api", DogsWeb do
  #   pipe_through :api
  # end
end
