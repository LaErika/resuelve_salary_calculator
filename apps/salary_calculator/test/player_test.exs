defmodule SalaryCalculator.PlayerTest do
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

  @extract_player_array [
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

  test "players" do
    assert SalaryCalculator.Player.fetch_players(@player_data) == @extract_player_array
  end

  @level "A"

  test "level_player" do
    assert SalaryCalculator.Player.goals_expected_by(@level) == 5
  end
end
