# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     StarseaCompass.Repo.insert!(%StarseaCompass.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

StarseaCompass.Accounts.create_user(%{
  email: "test@test.com",
  password: "password123"
})