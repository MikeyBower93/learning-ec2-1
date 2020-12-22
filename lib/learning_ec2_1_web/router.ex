defmodule LearningEc21Web.Router do
  use LearningEc21Web, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {LearningEc21Web.LayoutView, :root}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LearningEc21Web do
    pipe_through :browser

    # get "/", PageController, :index
    live "/", LiveView.Clocks
  end

  # Other scopes may use custom stacks.
  # scope "/api", LearningEc21Web do
  #   pipe_through :api
  # end
end
