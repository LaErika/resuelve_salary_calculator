defmodule SalaryCalculatorWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @spec start(atom(), :permanent | :transient | :temporary) :: {:ok, pid()} | {:error, term()}
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SalaryCalculatorWeb.Telemetry,
      # Start the Endpoint (http/https)
      SalaryCalculatorWeb.Endpoint
      # Start a worker by calling: SalaryCalculatorWeb.Worker.start_link(arg)
      # {SalaryCalculatorWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SalaryCalculatorWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @spec config_change(any, any, any) :: :ok
  def config_change(changed, _new, removed) do
    SalaryCalculatorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
