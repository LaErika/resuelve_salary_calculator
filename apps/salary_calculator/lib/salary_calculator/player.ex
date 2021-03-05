defmodule SalaryCalculator.Player do
  @moduledoc """
  This module performed operation for player
  """

  @spec fetch_players(map) :: any
  def fetch_players(players_data) do
    %{"jugadores" => players} = players_data
    players
  end

  @spec goals_expected_by(<<_::8, _::_*32>>) :: 5 | 10 | 15 | 20
  def goals_expected_by(level) do
    case level do
      "A" -> 5
      "B" -> 10
      "C" -> 15
      "Cuauh" -> 20
    end
  end

  @spec format(nil | maybe_improper_list | map, any, any) :: %{optional(<<_::32, _::_*8>>) => any}
  def format(player, expected_goals, salary_with_bonus) do
    %{
      "nombre" => player["nombre"],
      "goles_minimos" => expected_goals,
      "goles" => player["goles"],
      "sueldo" => player["sueldo"],
      "bono" => player["bono"],
      "sueldo_completo" => salary_with_bonus,
      "equipo" => player["equipo"]
    }
  end
end
