defmodule SalaryCalculator.TeamPlayer do
  @moduledoc """
  This module performed operation for player
  """

  alias SalaryCalculator.FullPlayer

  @spec goals_expected_by(String.t()) :: integer()
  def goals_expected_by(level) do
    case level do
      "A" -> 5
      "B" -> 10
      "C" -> 15
      "Cuauh" -> 20
    end
  end

  @spec format(SalaryCalculatorWeb.Schemas.Player.t(), integer(), float()) :: FullPlayer.t()
  def format(player, expected_goals, salary_with_bonus) do
    string_salary = :erlang.float_to_binary(salary_with_bonus, decimals: 2)

    %FullPlayer{
      nombre: player.nombre,
      goles_minimos: expected_goals,
      goles: player.goles,
      sueldo: player.sueldo,
      bono: player.bono,
      sueldo_completo: string_salary,
      equipo: player.equipo
    }
  end
end
