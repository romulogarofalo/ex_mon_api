defmodule ExMonApi.Controllers.TrainerControllerTest do
  use ExMonApiWeb.ConnCase

  alias ExMonApi.Trainer

  describe "show/2" do
    test "when there is a transfer with the given id, returns the trainer", %{conn: conn} do
      params = %{name: "romulo", password: "123123"}

      {:ok, %Trainer{id: id}} = ExMonApi.create_trainer(params)

      response =
        conn
        |> get(Routes.trainers_path(conn, :show, id))
        |> json_response(:ok)

      assert %{"id" => _id, "inserted_at" => inserted_at, "name" => "romulo"} = response

    end

    test "when there is an error, returns the error", %{conn: conn} do

      response =
        conn
        |> get(Routes.trainers_path(conn, :show, "123"))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid ID format!"}

      assert expected_response == response
    end
  end

end
