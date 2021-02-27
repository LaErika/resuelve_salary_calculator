defmodule SalaryCalculatorWeb.PlayerControllerTest do
  use SalaryCalculatorWeb.ConnCase

  @players_data %{
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

  @salary_response %{
    "jugadores" => [
      %{
        "nombre" => "El Rulo",
        "goles_minimos" => 10,
        "goles" => 9,
        "sueldo" => 30_000,
        "bono" => 15_000,
        "sueldo_completo" => 14_250,
        "equipo" => "rojo"
      }
    ]
  }

  test "calculate_salary", %{conn: conn} do
    conn =
      conn
      |> put_req_header("accep", "application/json")
      |> put_req_header("content-type", "application/json")
      |> post("api/players/calculate_salary", @players_data)

    assert json_response(conn, 200) == @salary_response
  end
end
