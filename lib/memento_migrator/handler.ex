defmodule MementoMigrator.Handler do
  @moduledoc """
  Simple utility for running Memento migrations
  """

  alias MementoMigrator.Loader

  @doc """
  Run migrations workflow
  """
  def migrate do
    nodes = [node()]
    nodes |> setup() |> migrate(nodes)
  end

  @doc """
  Run rollback operations
  """
  def rollback do
    raise "TODO"
  end

  defp setup(nodes) do
    Memento.Schema.create(nodes)
    Memento.start()
  end

  defp migrate(:ok, nodes) do
    IO.puts "Running migrations for '#{Mix.env()}' environment 🚀"

    Loader.load()
    |> Enum.each(&(handle_module(&1, nodes)))
  end

  defp migrate(_, _), do: raise("Can't setup a database")

  defp handle_module(module_name, nodes) do
    IO.puts "* Handling #{module_name}"

    apply(module_name, :up, [nodes])
  end
end
