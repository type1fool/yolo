defmodule YoloWeb.DebounceLive do
  use YoloWeb, :live_view
  require Logger

  def mount(_params, _session, socket) do
    {
      :ok,
      socket
      |> assign(form: to_form(%{}, as: "yolo"))
    }
  end

  def handle_event("validate", %{"yolo" => params}, socket) do
    Logger.info(validate: params)

    {
      :noreply,
      socket
      |> assign(form: to_form(params, as: "yolo"))
    }
  end

  def handle_event("pewpew", %{"yolo" => params}, socket) do
    Logger.info(pewpew: params)

    {
      :noreply,
      socket
      |> push_navigate(to: ~p"/pewpew?#{params}")
    }
  end
end
