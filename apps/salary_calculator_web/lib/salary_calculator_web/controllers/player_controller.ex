defmodule SalaryCalculatorWeb.PlayerController do
  use SalaryCalculatorWeb, :controller

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _) do
    json(conn, %{
      "jugadores" => [
        %{
          "bono" => 15_000,
          "equipo" => "rojo",
          "goles" => 9,
          "nombre" => "El Rulo",
          "sueldo" => 30_000,
          "sueldo_completo" => 14_250,
          "goles_minimos" => 10
        }
      ]
    })
  end
end
