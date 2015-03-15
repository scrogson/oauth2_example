defmodule OAuth2Example.Web do
  def view do
    quote do
      use Phoenix.View, root: "web/templates"

      # Import URL helpers from the router
      import OAuth2Example.Router.Helpers

      # Import all HTML functions (forms, tags, etc)
      use Phoenix.HTML
    end
  end

  def controller do
    quote do
      use Phoenix.Controller

      # Import URL helpers from the router
      import OAuth2Example.Router.Helpers
    end
  end

  def model do
    quote do
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
