defmodule SalaryCalculatorWeb.PlayerController do
  use SalaryCalculatorWeb, :controller
  use OpenApiSpex.ControllerSpecs

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
  def calculate(conn, params) do
    calculate_salary = SalaryCalculator.Salary.calculate_payroll(params)
    json(conn, calculate_salary)
  end
end
