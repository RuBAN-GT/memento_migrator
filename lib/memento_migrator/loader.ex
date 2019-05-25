defmodule MementoMigrator.Loader do
  @moduledoc """
  Helper module for loading migration modules from specific directory
  """

  @spec load() :: list(module)
  def load() do
    (migrations_path() <> "/*.exs")
    |> Path.wildcard()
    |> Enum.map(&extract_migration/1)
    |> Enum.filter(fn x -> x != nil end)
  end

  defp migrations_path do
    Mix.Project.config()[:app]
    |> Application.app_dir("priv/memento/migrations")
  end

  defp extract_migration(file_path) do
    Code.require_file(file_path)
    |> List.first()
    |> case do
      {module, _binary} -> module
      _ -> nil
    end
  end
end
