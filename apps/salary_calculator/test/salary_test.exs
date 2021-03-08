defmodule SalaryCalculator.SalaryTest do
  use ExUnit.Case

  @player_data %SalaryCalculatorWeb.Schemas.PlayerRequest{
    jugadores: [
      %SalaryCalculatorWeb.Schemas.Player{
        bono: 15_000,
        equipo: "rojo",
        goles: 9,
        nivel: "B",
        nombre: "El Rulo",
        sueldo: 30_000,
        sueldo_completo: nil
      }
    ]
  }

  @calculate_salary %SalaryCalculator.PlayerResponse{
    jugadores: [
      %SalaryCalculator.FullPlayer{
        bono: 15_000,
        equipo: "rojo",
        goles: 9,
        goles_minimos: 10,
        nombre: "El Rulo",
        sueldo: 30_000,
        sueldo_completo: "43500.00"
      }
    ]
  }

  test "calculate" do
    assert SalaryCalculator.Salary.calculate_payroll(@player_data) == @calculate_salary
  end
end
