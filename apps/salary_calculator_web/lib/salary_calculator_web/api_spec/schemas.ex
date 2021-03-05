defmodule SalaryCalculatorWeb.Schemas do
  alias OpenApiSpex.Schema

  defmodule Players do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "Players",
      description: "And array of players",
      type: :object,
      properties: %{},
      required: [],
      example: %{}
    })
  end

  defmodule PlayerRequest do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "PlayersRequest",
      description: "POST body for calculate players salary",
      type: :object,
      properties: %{
        players: %Schema{anyOf: [Players]}
      },
      required: [:players],
      example: %{
        "jugadores" => []
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
        "jugadores" => []
      }
    })
  end
end
