defmodule SalaryCalculator.SalaryTest do
  use ExUnit.Case

  @player_data %{
    "jugadores" => [
      %{
        "bono" => 15_000,
        "equipo" => "rojo",
        "goles" => 9,
        "nivel" => "B",
        "nombre" => "El Rulo",
        "sueldo" => 30_000,
        "sueldo_completo" => nil
      }
    ]
  }

  @calculate_salary %{
    "jugadores" => [
      %{
        "bono" => 15_000,
        "equipo" => "rojo",
        "goles" => 9,
        "nombre" => "El Rulo",
        "sueldo" => 30_000,
        "sueldo_completo" => 4.35e4,
        "goles_minimos" => 10
      }
    ]
  }

  @team_map %{
    "azul" => [
      %{
        "bono" => 15_000,
        "equipo" => "rojo",
        "goles" => 9,
        "nivel" => "B",
        "nombre" => "El Rulo",
        "sueldo" => 30_000,
        "sueldo_completo" => nil
      }
    ]
  }

  @team_bonus_reached 0.76

  @player_map %{
    "bono" => 15_000,
    "equipo" => "rojo",
    "goles" => 9,
    "nivel" => "B",
    "nombre" => "El Rulo",
    "sueldo" => 30_000,
    "sueldo_completo" => nil
  }

  @player_with_salary %{
    "goles_minimos" => 10,
    "equipo" => "rojo",
    "goles" => 9,
    "nombre" => "El Rulo",
    "sueldo" => 30_000,
    "sueldo_completo" => 42_450,
    "bono" => 15_000
  }

  test "calculate" do
    assert SalaryCalculator.Salary.calculate_payroll(@player_data) == @calculate_salary
  end

  test "calculate_salary" do
    assert SalaryCalculator.Salary.calculate_salary(@team_map) == @calculate_salary
  end

  test "bonus_per_player" do
    assert SalaryCalculator.Salary.bonus_per_player(@team_bonus_reached, @player_map) ==
             @player_with_salary
  end
end
