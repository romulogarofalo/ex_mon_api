defmodule ExMonApi.TrainerTest do
  use ExMonApi.DataCase

  alias ExMonApi.Trainer

  describe "trainer" do
    @valid_attrs %{ name: "romulo", password: "123123" }
    @invalid_attrs %{ name: "romulo", password: "12312" }

    test "create_trainer/1 with valid data to create trainer" do
      response = Trainer.build(@valid_attrs)
      {:ok, %Trainer{} = trainer}  = response

      assert trainer.name     == "romulo"
      assert trainer.password == "123123"
      assert %Ecto.Changeset{
        changes: %{
          name: "Romulo",
          password: "123123"
        },
        errors: [],
        data: ExMonApi.Trainer,
        valid?: true,
      }
    end

    test "create_trainer/1 with invalid data return error changeset" do
      {:error, response} = Trainer.build(@invalid_attrs)
      assert %Ecto.Changeset{valid?: false} = response
      assert errors_on(response) == %{password: ["should be at least 6 character(s)"]}
    end
  end
end
