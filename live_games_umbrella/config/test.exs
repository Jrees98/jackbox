import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :live_games, LiveGames.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "live_games_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :live_games_web, LiveGamesWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "r/wancZmdm78XizjU1WlwtLu7dLDRHC9LqX0RRSg/0kmcAjsyDNxEm/UrkEeW25L",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# In test we don't send emails.
config :live_games, LiveGames.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
