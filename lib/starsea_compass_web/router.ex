defmodule StarseaCompassWeb.Router do
  use StarseaCompassWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", StarseaCompassWeb do
    pipe_through :api
  end
end
