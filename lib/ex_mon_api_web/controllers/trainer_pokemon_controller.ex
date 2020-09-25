defmodule ExMonApiWeb.TrainerPokemonController do
  use ExMonApiWeb, :controller

  action_fallback ExMonApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMonApi.create_trainer_pokemon()
    |> handle_response(conn, "create.json", :created)
  end

  defp handle_response({:ok, pokemon}, conn, view, status) do
    IO.inspect(pokemon)

    conn
    |> put_status(status)
    |> render(view, trainer_pokemon: pokemon)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error


end
