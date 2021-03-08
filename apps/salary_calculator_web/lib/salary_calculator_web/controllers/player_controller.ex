defmodule SalaryCalculatorWeb.PlayerController do
  use SalaryCalculatorWeb, :controller
  use OpenApiSpex.ControllerSpecs
  plug OpenApiSpex.Plug.CastAndValidate, json_render_error_v2: true
  @type t() :: %SalaryCalculatorWeb.Schemas.PlayerRequest{}

  alias SalaryCalculatorWeb.Schemas.{PlayerResponse, PlayerRequest}

  operation(:calculate,
    summary: "Calculate players salary",
    parameters: [],
    request_body: {"Players param", "application/json", PlayerRequest, required: true},
    responses: [
      ok: {"Player response", "application/json", PlayerResponse}
    ]
  )

  @spec calculate(Plug.Conn.t(), any) :: Plug.Conn.t()
  def calculate(%{body_params: body_params} = conn, _) do
    calculate_salary = SalaryCalculator.Salary.calculate_payroll(body_params)
    json(conn, calculate_salary)
  end
end
