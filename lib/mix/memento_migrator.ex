defmodule Mix.MementoMigrator do
  @moduledoc """
  Helper for Mix tasks
  """

  def load_env do
    Mix.Tasks.Loadpaths.run []
  end
end
