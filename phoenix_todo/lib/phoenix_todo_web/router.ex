defmodule PhoenixTodoWeb.Router do
  use PhoenixTodoWeb, :router

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

  scope "/", PhoenixTodoWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/todos", TodoController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixTodoWeb do
  #   pipe_through :api
  # end
end
