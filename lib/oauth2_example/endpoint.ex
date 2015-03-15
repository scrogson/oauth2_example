defmodule OAuth2Example.Endpoint do
  use Phoenix.Endpoint, otp_app: :o_auth2_example

  plug Plug.Static,
    at: "/", from: :o_auth2_example,
    only: ~w(css js images)

  plug Plug.Logger

  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_oauth2_example_key",
    signing_salt: "rqz0upBw",
    encryption_salt: "NJw6uNqn"

  plug :router, OAuth2Example.Router
end
