defmodule Mix.Tasks.MementoMigrator.Migrate do
  use Mix.Task

  @shortdoc "Run migrations from priv directory"
  def run(_) do
    Mix.MementoMigrator.load_env()
    MementoMigrator.Handler.migrate()
  end
end
