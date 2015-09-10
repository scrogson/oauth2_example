use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :oauth2_example, OAuth2Example.Endpoint,
  secret_key_base: "dTohLI9X1McWrgSSTRh3Q/y26cf6tqkhbwxq3sTJru6vY+Z0MjAbPd1SzQNhAZkM"

# Configure your database
config :oauth2_example, OAuth2Example.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "oauth2_example_prod",
  pool_size: 20
