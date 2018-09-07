defmodule StarseaCompassWeb.Pipelines.V1.Auth do
  @moduledoc false
  use Guardian.Plug.Pipeline,
    otp_app: :starsea_compass,
    module: StarseaCompass.Accounts.Auth,
    error_handler: StarseaCompassWeb.V1.AuthController

  plug(Guardian.Plug.VerifyHeader, realm: "Bearer")
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource)
end