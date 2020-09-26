defmodule ExMonApiWeb.TrainerPokemonView do
  use ExMonApiWeb, :view

  alias ExMonApi.Trainer.Pokemon

  def render("show.json", %{
    trainer_pokemon: %Pokemon{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        trainer_id: trainer_id,
        weight: weight,
      }
    }) do
      %{
        pokemon: %{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          trainer_id: trainer_id,
          weight: weight,
        }
      }
    end

  def render("create.json", %{
    trainer_pokemon: %Pokemon{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nickname: nickname,
        types: types,
        trainer_id: trainer_id,
        weight: weight,
      }
    }) do
    %{
      message: "Pokemon Created",
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nickname: nickname,
        types: types,
        trainer_id: trainer_id,
        weight: weight,
      }
    }
  end

end
