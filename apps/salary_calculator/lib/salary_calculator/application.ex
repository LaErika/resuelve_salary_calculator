defmodule SalaryCalculator.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @spec start(atom(), :permanent | :transient | :temporary) :: {:ok, pid()} | {:error, term()}
  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: SalaryCalculator.PubSub}
      # Start a worker by calling: SalaryCalculator.Worker.start_link(arg)
      # {SalaryCalculator.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: SalaryCalculator.Supervisor)
  end
end
