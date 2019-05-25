defmodule Mix.Tasks.MementoMigrator.Rollback do
  use Mix.Task

  @shortdoc "Run rollback operations from priv directory"
  def run(_) do
    Mix.MementoMigrator.load_env()
    MementoMigrator.Handler.rollback()
  end
end
