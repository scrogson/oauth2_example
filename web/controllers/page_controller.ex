defmodule OAuth2Example.PageController do
  use OAuth2Example.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
