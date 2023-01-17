defmodule Devfinder.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    topologies = Application.get_env(:libcluster, :topologies) || []

    children = [
      # Start the Ecto repository
      Devfinder.Repo,
      # Start the Telemetry supervisor
      DevfinderWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Devfinder.PubSub},
      # Start the Endpoint (http/https)
      DevfinderWeb.Endpoint,
      # Start a worker by calling: Devfinder.Worker.start_link(arg)
      # {Devfinder.Worker, arg}

      # setup for clustering
      {Cluster.Supervisor, [topologies, [name: Devfinder.ClusterSupervisor]]},
      {Finch, name: Http}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Devfinder.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DevfinderWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
