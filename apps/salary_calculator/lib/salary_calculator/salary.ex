defmodule SalaryCalculator.Salary do
  @moduledoc """
  This module calculate total salary for players
  """
  alias SalaryCalculator.Team
  alias SalaryCalculator.Player

  @spec calculate_payroll(map) :: %{optional(<<_::72>>) => list}
  def calculate_payroll(data) do
    players = Player.fetch_players(data)

    players
    |> Team.group_by_name()
    |> calculate_salary()
  end

  @spec calculate_salary(map) :: %{optional(<<_::72>>) => list}
  def calculate_salary(team_groups) do
    keys = Map.keys(team_groups)

    result =
      Enum.flat_map(keys, fn color ->
        team = Map.get(team_groups, color)
        goals_per_team = Team.calculate_goals_per_team(team)

        expected_goals_per_team = Team.calculate_expected_goals_per_team(team)

        team_bonus_reached = calculate_bonus_percentage(goals_per_team, expected_goals_per_team)

        Enum.map(team, fn player ->
          bonus_per_player(team_bonus_reached, player)
        end)
      end)

    %{"jugadores" => result}
  end

  defp calculate_bonus_percentage(scored_goals, expected_goals) do
    result = scored_goals / expected_goals
    if result >= 1, do: 1.0, else: result
  end

  @spec bonus_per_player(number, map) :: %{optional(<<_::32, _::_*8>>) => any}
  def bonus_per_player(team_bonus_reached, player) do
    %{"nivel" => level, "goles" => goals, "bono" => bonus, "sueldo" => salary} = player
    expected_goals = Player.goals_expected_by(level)
    individual_bonus = calculate_bonus_percentage(goals, expected_goals)
    total_reach = (team_bonus_reached + individual_bonus) / 2
    salary_with_bonus = bonus * total_reach + salary
    Player.format(player, expected_goals, salary_with_bonus)
  end
end
