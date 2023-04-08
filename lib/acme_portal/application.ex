defmodule AcmePortal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AcmePortalWeb.Telemetry,
      # Start the Ecto repository
      AcmePortal.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: AcmePortal.PubSub},
      # Start Finch
      {Finch, name: AcmePortal.Finch},
      # Start the Endpoint (http/https)
      AcmePortalWeb.Endpoint
      # Start a worker by calling: AcmePortal.Worker.start_link(arg)
      # {AcmePortal.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AcmePortal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AcmePortalWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
