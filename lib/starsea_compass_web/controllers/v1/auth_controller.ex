defmodule StarseaCompassWeb.V1.AuthController do
  use StarseaCompassWeb, :controller

  alias StarseaCompass.Accounts.Auth

  action_fallback(StarseaCompassWeb.V1.FallbackController)

  def create(conn, %{"email" => email, "password" => password}) do
    with {:ok, user} <- Auth.authenticate_user(email, password),
         {:ok, token, _} <- Auth.encode_and_sign(user) do
      conn
      |> json(%{"token" => token})
    else
      {:error, :invalid_credentials} -> 
        conn
        |> put_status(401)
        |> json(%{"error" => "Incorrect email address and/or password."})
      {:error, reason} -> 
        conn
        |> put_status(500)
        |> json(%{"error" => "Internal Server Error: " <> to_string(reason)})
    end
  end

  def create(conn, _bad_request) do
    conn
    |> put_status(400)
    |> json(%{
      "error" => "Invalid request parameters.",
      "expected" => %{
        "email" => "[YOUR_ACCOUNT_EMAIL_ADDRESS]",
        "password" => "[YOUR_ACCOUNT_PASSWORD]"
      }
    })
  end

  def auth_error(conn, {type, _reason}, _opts) do
    conn
    |> put_status(401)
    |> json(%{"error" => "Authentication Error: " <> to_string(type)})
  end

end