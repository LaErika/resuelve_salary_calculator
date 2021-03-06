defmodule SalaryCalculator.TeamTest do
  use ExUnit.Case

  @players_array [
    %{
      "bono" => 30_000,
      "equipo" => "azul",
      "goles" => 30,
      "nivel" => "Cuauh",
      "nombre" => "El Cuauh",
      "sueldo" => 100_000,
      "sueldo_completo" => nil
    }
  ]

  @team_map %{
    "azul" => [
      %{
        "bono" => 30_000,
        "equipo" => "azul",
        "goles" => 30,
        "nivel" => "Cuauh",
        "nombre" => "El Cuauh",
        "sueldo" => 100_000,
        "sueldo_completo" => nil
      }
    ]
  }

  @team_array [
    %{
      "bono" => 30_000,
      "equipo" => "azul",
      "goles" => 30,
      "nivel" => "Cuauh",
      "nombre" => "EL Cuauh",
      "sueldo" => 100_000,
      "sueldo_completo" => nil
    }
  ]

  test "group_team" do
    assert SalaryCalculator.Team.group_by_name(@players_array) == @team_map
  end

  test "calculate_goals_per_team" do
    assert SalaryCalculator.Team.calculate_goals_per_team(@team_array) == 30
  end

  test "calculate_expected_goals_per_team" do
    assert SalaryCalculator.Team.calculate_expected_goals_per_team(@team_array) == 20
  end
end
