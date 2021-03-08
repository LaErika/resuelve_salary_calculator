defmodule SalaryCalculator.FullPlayer do
  @moduledoc """
  This module represents a player with salary calculated
  """
  @type t() :: %__MODULE__{
          nombre: String.t(),
          goles_minimos: integer(),
          goles: integer(),
          sueldo: integer(),
          bono: integer(),
          sueldo_completo: String.t(),
          equipo: String.t()
        }
  @keys ~w(nombre goles_minimos goles sueldo bono sueldo_completo equipo)a
  @enforce_keys @keys
  @derive Jason.Encoder
  defstruct @keys
end
