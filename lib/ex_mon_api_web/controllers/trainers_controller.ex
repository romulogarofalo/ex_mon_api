defmodule ExMonApiWeb.TrainersController do
  use ExMonApiWeb, :controller

  action_fallback ExMonApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMonApi.create_trainer()
    |> handle_response(conn)
  end

  defp handle_response({:ok, trainer}, conn) do
    conn
    |> put_status(:ok)
    |> render("create.json", trainer: trainer)
  end

  defp handle_response({:error, _changeset} = error, _conn), do: error


  def delete(conn, id) do
    id
    |> ExMonApi.delete_trainer()
    |> handle_delete(conn)
  end

  defp handle_delete({:ok, _trainer}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end


end
