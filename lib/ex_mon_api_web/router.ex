defmodule ExMonApiWeb.Router do
  use ExMonApiWeb, :router

  alias ExMonApiWeb

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug ExMonApiWeb.Auth.Pipeline
  end

  # pipeline :ensure_auth do
  #   plug Guardian.Plug.EnsureAuthenticated
  # end

  scope "/api", ExMonApiWeb do
    pipe_through [:api, :auth]

    resources "/trainers", TrainersController, only: [:show, :delete, :update]
    resources "/trainer_pokemon", TrainerPokemonController
  end

  scope "/api", ExMonApiWeb do
    pipe_through [:api]

    post "/login", TrainersController, :login
    post "/trainers", TrainersController, :create
    get "/pokemon/:name", PokemonsController, :show
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: ExMonApiWeb.Telemetry
    end
  end

  scope "/", ExMonApiWeb do
    pipe_through :api

    get "/", WelcomeController, :index

  end
end
