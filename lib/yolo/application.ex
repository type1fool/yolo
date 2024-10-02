defmodule Yolo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      YoloWeb.Telemetry,
      Yolo.Repo,
      {DNSCluster, query: Application.get_env(:yolo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Yolo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Yolo.Finch},
      # Start a worker by calling: Yolo.Worker.start_link(arg)
      # {Yolo.Worker, arg},
      # Start to serve requests, typically the last entry
      YoloWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Yolo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    YoloWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
