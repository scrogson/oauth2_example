use Mix.Config

config :o_auth2_example, OAuth2Example.Endpoint,
  http: [port: System.get_env("PORT") || 4000],
  watchers: [{Path.expand("node_modules/brunch/bin/brunch"), ["watch"]}],
  debug_errors: true

config :o_auth2_example, OAuth2Example.Endpoint,
  live_reload: [Path.expand("priv/static/js/app.js"),
                Path.expand("priv/static/css/app.css"),
                Path.expand("web/templates/**/*.eex")]

# Enables code reloading for development
config :phoenix, :code_reloader, true
