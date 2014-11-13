defmodule OAuth2Example.Mixfile do
  use Mix.Project

  def project do
    [app: :oauth2_example,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: ["lib", "web"],
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps]
  end

  def application do
    [mod: {OAuth2Example, []},
     applications: [:phoenix, :cowboy, :logger, :httpoison]]
  end

  defp deps do
    [{:phoenix, github: "phoenixframework/phoenix"},
     {:cowboy, "~> 1.0"},
     {:oauth2, github: "scrogson/oauth2"},
     {:httpoison, "0.5.0"}]
  end
end
