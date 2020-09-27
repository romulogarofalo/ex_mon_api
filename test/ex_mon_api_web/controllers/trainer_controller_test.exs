defmodule ExMonApi.Controllers.TrainerControllerTest do
  use ExMonApiWeb.ConnCase

  alias ExMonApi.Trainer

  describe "show/2" do
    test "when there is a transfer with the given id, returns the trainer", %{conn: conn} do
      params = %{name: "romulo", password: "123123"}

      {:ok, %Trainer{id: id} = ExMonApi.create_trainer(params)}

      response =
        conn
        |> get(Routes.trainers_path(conn, :show, id))
        |> json_response(:ok)

      assert response == "Trainer Created"

    end
  end

end
