defmodule ExMonApiWeb.Auth.Guardian do
  use Guardian, otp_app: :ex_mon_api

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
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
end
