defmodule PingFed do
  @moduledoc """
  An OAuth2 strategy for PingFederate.
  see how to setup PingFederate here https://github.com/SilentCircle/sso-integration-doc/blob/master/PingFederate-Integration-Customer-Responsibilities.md
  """
  use OAuth2.Strategy

  alias OAuth2.Strategy.AuthCode

  ##@hackney_options [ insecure: true] 

  
  defp config do
    [strategy: __MODULE__,
     client_id: System.get_env("PINGFED_CLIENT_ID"),
     client_secret: System.get_env("PINGFED_CLIENT_SECRET"),
     redirect_uri: System.get_env("PINGFED_REDIRECT_URI"),
     site: System.get_env("PINGFED_SITE"),
     authorize_url: System.get_env("PINGFED_SITE")<>"/as/authorization.oauth2",
     token_url: System.get_env("PINGFED_SITE")<>"/as/token.oauth2"
    ]
  end

  # Public API

  def client do
    Application.get_env(:oauth2_example, PingFed)
    |> Keyword.merge(config())
    |> OAuth2.Client.new()
  end

  def authorize_url!(params \\ []) do
    OAuth2.Client.authorize_url!(client(), params)
  end

  def get_token!(params \\ [], headers \\ []) do
    OAuth2.Client.get_token!(client(), Keyword.merge(params, client_secret: client().client_secret))##, headers, @hackney_options )
  end

  # Strategy Callbacks

  def authorize_url(client, params) do
    AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_header("Accept", "application/json")
    |> AuthCode.get_token(params, headers)
  end
end
