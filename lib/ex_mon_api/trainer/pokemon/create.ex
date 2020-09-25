defmodule ExMonApi.Trainer.Pokemon.Create do
  alias ExMonApi.PokeApi.Client
  alias ExMonApi.Trainer.Pokemon, as: TrainerPokemon
  alias ExMonApi.Pokemon
  alias ExMonApi.Repo

  def call(%{"name" => name} = params) do
    name
    |> Client.get_pokemon()
    |> handle_response(params)
  end

  defp handle_response({:ok, body}, params) do
    body
    |> Pokemon.build()
    |> create_pokemon(params)

  end

  defp handle_response({:error, _params} = error, _pass), do: error

  defp create_pokemon(%Pokemon{name: name, weight: weight, types: types}, %{
    "nickname" => nickname,
     "trainer_id" => trainer_id
  }) do
    params = %{
      name: name,
      nickname: nickname,
      weight: weight,
      types: types,
      trainer_id: trainer_id
    }

    params
    |> TrainerPokemon.build()
    |> handle_build()
  end

  defp handle_build({:ok, pokemon}), do: Repo.insert(pokemon)
  defp handle_build({:error, _changeset} = error), do: error

  # defp create_pokemon({:error, _changeset} = error), do: error

end
