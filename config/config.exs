# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config



config :salary_calculator_web,
  generators: [context_app: :salary_calculator]

# Configures the endpoint
config :salary_calculator_web, SalaryCalculatorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "W1lIsi5QZdjYSB/wx0csUySCpUMg6M9LEVidH8hTW06RmU7lK5jOHCkDgdt8H1YR",
  render_errors: [view: SalaryCalculatorWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: SalaryCalculator.PubSub,
  live_view: [signing_salt: "6J31wxDu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
