defmodule ExMonApiWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :ex_mon_api

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
