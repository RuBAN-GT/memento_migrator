defmodule Dummy.MixProject do
  use Mix.Project

  def project do
    [
      app: :dummy,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:memento, "~> 0.3.1"},
      {:memento_migrator, "~> 0.0.1", path: "../.."}
    ]
  end
end
