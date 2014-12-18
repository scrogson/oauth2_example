use Mix.Config

config :o_auth2_example, OAuth2Example.Endpoint,
  http: [port: System.get_env("PORT") || 4001],
  catch_errors: false
