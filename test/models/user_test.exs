defmodule StarseaCompass.UserTest do
  use StarseaCompass.ModelCase

  alias StarseaCompass.User

  @valid_attrs %{email: "some email", password: "some password"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
