defmodule StarseaCompass.Accounts do

  alias StarseaCompass.Repo
  alias StarseaCompass.Accounts.{User}

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def get_user!(id), do: Repo.get!(User, id)

  def get_user_by(by), do: Repo.get_by(User, by)

end