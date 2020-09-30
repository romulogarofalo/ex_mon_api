defmodule ExMonApiWeb.Auth.Guardian do
  use Guardian, otp_app: :ex_mon_api

  alias ExMonApi.{Repo, Trainer}

  def subject_for_token(resource, _claims) do
    {:ok, resource}
  end

  # def subject_for_token(_, _) do
  #   {:error, :reason_for_error}
  # end

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> ExMonApi.fetch_trainer()
  # def resource_from_claims(_claims) do
  #   {:error, :reason_for_error}
  end

  def authenticate(%{"id" => trainer_id, "password" => password}) do
    case Repo.get(Trainer, trainer_id) do
      nil -> {:error, "Trainer not found"}
      trainer -> validate_password(trainer, password)
    end
  end

  defp validate_password(%Trainer{password_hash: hash} = trainer, password) do
    case Argon2.verify_pass(password, hash) do
      true -> create_token(trainer)
      false -> {:error, :unauthorized}
    end
  end

  defp create_token(trainer) do
    {:ok, token, _claims} = encode_and_sign(trainer)
    {:ok, token}
  end

end
