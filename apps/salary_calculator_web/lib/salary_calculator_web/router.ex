defmodule SalaryCalculatorWeb.Router do
  use SalaryCalculatorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug OpenApiSpex.Plug.PutApiSpec, module: SalaryCalculatorWeb.ApiSpec
  end

  scope "/api" do
    pipe_through :api
    post "/players/calculate_salary", SalaryCalculatorWeb.PlayerController, :calculate
    get "/openapi", OpenApiSpex.Plug.RenderSpec, []
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: SalaryCalculatorWeb.Telemetry
    end
  end
end
