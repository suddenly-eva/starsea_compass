defmodule StarseaCompassWeb.V1.SecretController do
  use StarseaCompassWeb, :controller

  action_fallback(StarseaCompassWeb.V1.FallbackController)

  def index(conn, _) do
    json(conn, %{"easter_egg" => "Hello! Good job finding this place... Hope you're having fun! ~Eva"})
  end

end