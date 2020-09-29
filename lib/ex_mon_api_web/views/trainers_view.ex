defmodule ExMonApiWeb.TrainersView do
  use ExMonApiWeb, :view

  alias ExMonApi.Trainer

  def render("create.json", %{
      trainer: %Trainer{id: id, name: name, inserted_at: inserted_at},
      token: token
    }) do
    %{
      message: "Trainer Created",
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      },
      token: token
    }
  end

  def render("show.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      id: id,
      name: name,
      inserted_at: inserted_at
    }
  end

  def render("update.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at, updated_at: updated_at}}) do
    %{
      message: "Trainer Updated",
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        updated_at: updated_at
      }
    }
  end

end
