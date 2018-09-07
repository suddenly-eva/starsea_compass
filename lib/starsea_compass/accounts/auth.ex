
defmodule StarseaCompass.Accounts.Auth do
  use Guardian, otp_app: :starsea_compass

  alias Comeonin.Bcrypt
  alias StarseaCompass.Accounts

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(%{"sub" => id}) do
    case Accounts.get_user!(id) do
      nil -> {:error, :resource_not_found}
      user -> {:ok, user}
    end
  end

  def authenticate_user(email, plain_text_password) do
    case Accounts.get_user_by(email: email) do
      nil ->
        Bcrypt.dummy_checkpw()
        {:error, :invalid_credentials}
      user ->
        if Bcrypt.checkpw(plain_text_password, user.password) do
          {:ok, user}
        else
          {:error, :invalid_credentials}
        end
    end
  end
  
end