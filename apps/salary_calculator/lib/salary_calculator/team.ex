defmodule SalaryCalculator.Team do
  @moduledoc """
  This module performs operations and calculations for teams
  """
  alias SalaryCalculator.Player

  @spec group_by_name(any) :: any
  def group_by_name(players) do
    Enum.reduce(players, %{}, fn player, acc_team_groups ->
      %{"equipo" => team_color} = player
      update_teams(acc_team_groups, team_color, player)
    end)
  end

  @spec update_teams(map, any, any) :: map
  def update_teams(team_groups, color, player) do
    if Map.has_key?(team_groups, color) do
      team_color = Map.get(team_groups, color)
      update_team_groups = team_color ++ [player]
      Map.update!(team_groups, color, fn _ -> update_team_groups end)
    else
      Map.put(team_groups, color, [player])
    end
  end

  @spec calculate_goals_per_team(any) :: any
  def calculate_goals_per_team(team) do
    Enum.reduce(team, 0, fn player, acc ->
      %{"goles" => goles} = player
      goles + acc
    end)
  end

  @spec calculate_expected_goals_per_team(any) :: any
  def calculate_expected_goals_per_team(team) do
    Enum.reduce(team, 0, fn player, acc ->
      %{"nivel" => level} = player
      Player.goals_expected_by(level) + acc
    end)
  end
end
