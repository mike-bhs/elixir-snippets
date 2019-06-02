defmodule SupervisorExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {SupervisorExample.UsersStorage, [%{"john" => "john@gmail.com"}]}
      # Starts a worker by calling: SupervisorExample.Worker.start_link(arg)
      # {SupervisorExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SupervisorExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
