defmodule OAuth2Example.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :assign_current_user
  end

  pipeline :auth do
    plug :put_oauth_strategy
  end

  scope "/", alias: OAuth2Example do
    pipe_through :browser
    get "/", PageController, :index
  end

  scope "/auth", alias: OAuth2Example do
    pipe_through [:browser, :auth]
    get "/", AuthController, :index
    get "/callback", AuthController, :callback
  end

  # Fetch the current user from the session and add it to `conn.assigns`. This
  # will allow you to have access to the current user in your views with
  # `@current_user`.
  defp assign_current_user(conn, _) do
    assign(conn, :current_user, get_session(conn, :current_user))
  end

  # Fetch the configured strategy from the router's config and store the
  # initialized strategy into `conn.private.oauth2_strategy`.
  defp put_oauth_strategy(conn, _) do
    config = Application.get_all_env(:oauth2)
    {strategy, opts} = Keyword.pop(config, :strategy)
    put_private(conn, :oauth2_strategy, apply(strategy, :new, [opts]))
  end
end
