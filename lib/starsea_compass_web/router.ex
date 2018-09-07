defmodule StarseaCompassWeb.Router do
  use StarseaCompassWeb, :router

  @api_actions [:index, :show, :create, :update, :delete]

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :v1_auth do
    plug(StarseaCompassWeb.Pipelines.V1.Auth)
  end

  # Home Page
  get("/", StarseaCompassWeb.PageController, :index)

  # Auth - V1
  scope "/v1", StarseaCompassWeb.V1 do
    pipe_through :api
    resources("/auth", AuthController, as: :auth, only: [:create, :delete])
  end

  # API - V1
  scope "/v1", StarseaCompassWeb.V1 do
    pipe_through [:api, :v1_auth]
    resources("/secret", SecretController, only: [:index])
  end

end
