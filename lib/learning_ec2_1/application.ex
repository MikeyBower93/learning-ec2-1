defmodule LearningEc21.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LearningEc21Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LearningEc21.PubSub},
      # Start the Endpoint (http/https)
      LearningEc21Web.Endpoint,
      {LearningEc21.TimeZones, %{}}
      # Start a worker by calling: LearningEc21.Worker.start_link(arg)
      # {LearningEc21.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LearningEc21.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LearningEc21Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
