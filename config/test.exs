import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :librelix, LibrElix.Repo,
  port: 6543,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "librelix_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# Configures basic auth plug
config :librelix, :basic_auth,
  username: "test",
  password: "secret"

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :librelix, LibrElixWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "TawymAFc0cek7fL5PLdwofeNulT0dNLtVyFFB9isK/kqjYkRG5A5b32Le/B6SwsG",
  server: false

# In test we don't send emails.
config :librelix, LibrElix.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
