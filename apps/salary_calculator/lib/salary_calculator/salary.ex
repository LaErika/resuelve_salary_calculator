defmodule SalaryCalculator.Salary do
  @moduledoc """
  This module calculate total salary for players
  """

  alias SalaryCalculator.{Team, TeamPlayer, PlayerResponse}

  @spec calculate_payroll(SalaryCalculatorWeb.Schemas.PlayerRequest.t()) :: PlayerResponse.t()
  def calculate_payroll(data) do
    %{jugadores: players} = data

    players
    |> Team.group_by_name()
    |> calculate_salary()
  end

  defp calculate_salary(team_groups) do
    keys = Map.keys(team_groups)

    full_players =
      Enum.flat_map(keys, fn color ->
        team = Map.get(team_groups, color)
        goals_per_team = Team.calculate_goals_per_team(team)

        expected_goals_per_team = Team.calculate_expected_goals_per_team(team)

        team_bonus_reached = calculate_bonus_percentage(goals_per_team, expected_goals_per_team)

        Enum.map(team, fn player ->
          bonus_per_player(team_bonus_reached, player)
        end)
      end)

    %PlayerResponse{jugadores: full_players}
  end

  defp calculate_bonus_percentage(scored_goals, expected_goals) do
    result = scored_goals / expected_goals
    if result >= 1, do: 1.0, else: result
  end

  defp bonus_per_player(team_bonus_reached, player) do
    %{nivel: level, goles: goals, bono: bonus, sueldo: salary} = player
    expected_goals = TeamPlayer.goals_expected_by(level)
    individual_bonus = calculate_bonus_percentage(goals, expected_goals)
    total_reach = (team_bonus_reached + individual_bonus) / 2
    salary_with_bonus = bonus * total_reach + salary
    TeamPlayer.format(player, expected_goals, salary_with_bonus)
  end
end
