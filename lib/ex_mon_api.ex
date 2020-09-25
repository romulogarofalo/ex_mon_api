defmodule ExMonApi do
  alias ExMonApi.{Pokemon, Trainer}

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
  defdelegate delete_trainer(params), to: Trainer.Delete, as: :call
  defdelegate fetch_trainer(params), to: Trainer.Get, as: :call
  defdelegate update_trainer(params), to: Trainer.Update, as: :call

  defdelegate fetch_pokemon(params), to: Pokemon.Get, as: :call
  defdelegate create_trainer_pokemon(params), to: Trainer.Pokemon.Create, as: :call
  defdelegate delete_trainer_pokemon(params), to: Trainer.Pokemon.Delete, as: :call
end
