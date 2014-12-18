use Mix.Config

# ## SSL Support
#
# To get SSL working, you will need to set:
#
#     https: [port: 443,
#             keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#             certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables point to a file on
# disk for the key and cert.

config :o_auth2_example, OAuth2Example.Endpoint,
  url: [host: "example.com"],
  http: [port: System.get_env("PORT")],
  secret_key_base: "1r3bLthfeEv3UBkhdSdgff6dvQUgd6v42eeQVlxsgjG9dUfcLIcPoxtiJDcZrFeLliKA0UJs0w4kJ8ovm6ynfQ=="

config :logger,
  level: :info
