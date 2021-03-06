defmodule Bugs.Router do
  use Bugs.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Bugs do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  socket "/ws", Bugs do
    channel "quadrilateral", QuadrilateralChannel
  end

  # Other scopes may use custom stacks.
  # scope "/api", Bugs do
  #   pipe_through :api
  # end
end
