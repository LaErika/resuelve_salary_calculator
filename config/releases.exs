import Config
### Salary Calculator Web Config
config :salary_calculator_web, SalaryCalculatorWeb.Endpoint,
  server: true,
  load_from_system_env: false,
  http: [port: System.get_env("PORT", "4000") |> String.to_integer()],
  url: [
    host: System.get_env("SERVER", "localhost"),
    port: System.get_env("PORT", "4000") |> String.to_integer()
  ],
  secret_key_base:
    System.get_env(
      "SECRET_KEY_BASE",
      "hlfg/JeE3n9OtZ4qkQFe51XHFVkQmEBV/rfDWrxEU6cV4fkRYj0MtWSxcjK9ekz0"
    )
