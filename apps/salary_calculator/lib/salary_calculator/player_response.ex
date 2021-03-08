defmodule SalaryCalculator.PlayerResponse do
  @moduledoc """
  This module represents response sent
  """
  @type t() :: %SalaryCalculator.PlayerResponse{
          jugadores: [SalaryCalculator.FullPlayer.t()]
        }

  @keys ~w(jugadores)a
  @enforce_keys @keys
  @derive Jason.Encoder
  defstruct @keys
end
