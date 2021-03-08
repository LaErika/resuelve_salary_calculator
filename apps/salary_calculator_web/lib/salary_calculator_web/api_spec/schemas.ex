defmodule SalaryCalculatorWeb.Schemas do
  alias OpenApiSpex.Schema

  defmodule Player do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "Player",
      description: "A player for calculate his salary",
      type: :object,
      properties: %{
        nombre: %Schema{
          type: :string,
          description: "Player name"
        },
        nivel: %Schema{
          type: :string,
          description: "Level player"
        },
        goles: %Schema{
          type: :integer,
          description: "Goal per player"
        },
        sueldo: %Schema{
          type: :number,
          description: "Player salary"
        },
        bono: %Schema{
          type: :number,
          description: "Bonus for the player"
        },
        sueldo_completo: %Schema{
          type: :number,
          nullable: true,
          description: "Total salary player"
        },
        equipo: %Schema{
          type: :string,
          description: "Team name"
        }
      }
    })
  end

  defmodule Players do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "Players",
      description: "An array of players",
      type: :array,
      items: Player
    })
  end

  defmodule PlayerRequest do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "PlayersRequest",
      description: "POST body for calculate players salary",
      type: :object,
      properties: %{
        jugadores: %Schema{anyOf: [Players]}
      },
      required: [:jugadores],
      example: %{
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
    })
  end

  defmodule PlayerResponse do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "PlayersResponse",
      description: "Response schema for calculate players salary",
      type: :object,
      properties: %{
        data: Players
      },
      example: %{
        "jugadores" => [
          %{
            "bono" => 15_000,
            "equipo" => "rojo",
            "goles" => 9,
            "nombre" => "El Rulo",
            "sueldo" => 30_000,
            "sueldo_completo" => "43500.00",
            "goles_minimos" => 10
          }
        ]
      }
    })
  end
end
