defmodule OAuth2Example.PageControllerTest do
  use OAuth2Example.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
