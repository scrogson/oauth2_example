defmodule OAuth2Example.Mixfile do
  use Mix.Project

  def project do
    [app: :o_auth2_example,
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
    [{:phoenix, "~> 0.9.0"},
     {:cowboy, "~> 1.0"},
     {:oauth2, "~> 0.0.3"},
     {:plug, "~> 0.10.0", override: true}]
  end
end
