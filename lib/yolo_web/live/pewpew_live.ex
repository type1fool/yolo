defmodule YoloWeb.PewpewLive do
  use YoloWeb, :live_view

  def mount(params, _session, socket) do
    {
      :ok,
      socket
      |> assign(params: params)
    }
  end
end
