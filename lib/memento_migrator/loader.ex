defmodule MementoMigrator.Loader do
  @moduledoc """
  Helper module for loading migration modules from specific directory
  """

  @spec load() :: list(module)
  def load() do
    (migrations_path() <> "/*.exs")
    |> Path.wildcard()
    |> Enum.map(&extract_migration/1)
    |> Enum.filter(&(&1 != nil))
  end

  defp migrations_path do
    project_path |> Path.join("priv/memento/migrations")
  end

  defp extract_migration(file_path) do
    Code.require_file(file_path)
    |> List.first()
    |> case do
      {module, _binary} -> module
      _ -> nil
    end
  end

  defp project_path do
    app_name = Mix.Project.config()[:app]
    Mix.Project.deps_paths()[app_name] || File.cwd!()
  end
end
