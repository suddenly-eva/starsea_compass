defmodule StarseaCompassWeb.V1.GameChannel do
  use Phoenix.Channel

  def join("games:" <> game_id, _message, socket) do
    send(self(), {:after_join, game_id})
    {:ok, socket}
  end

  def handle_info({:after_join, game_id}, socket) do
    push socket, "system", %{status: "connected", game_id: game_id}
    {:noreply, socket}
  end

  def handle_in("hello", _payload, socket) do
    resp = %{message: "world"}
    {:reply, {:ok, resp}, socket}
  end

end