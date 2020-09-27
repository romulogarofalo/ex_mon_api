defmodule ExMonApi.CreateTrainerTest do
  use ExMonApi.DataCase

  alias ExMonApi.Trainer
  alias ExMonApi.Trainer.Create
  alias ExMonApi.Repo

  describe "call/1" do
    test "when all params are valid, creates a trainer" do
      params = %{name: "romulo", password: "123123"}

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      assert {:ok, %Trainer{name: "romulo"}} = response
      assert count_before < count_after
    end

    test "when theme are invalid params, returns the error" do
      params = %{name: "romulo"}

      response = Create.call(params)

      assert {:error, changeset} = response
      assert errors_on(changeset) == %{password: ["can't be blank"]}
    end
  end
end
