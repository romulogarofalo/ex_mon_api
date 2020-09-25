defmodule ExMonApi.Trainer.Pokemon.Get do
  alias ExMonApi.{Repo, Trainer.Pokemon}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Trainer not found"}
      pokemon -> {:ok, pokemon}
    end
  end
end
