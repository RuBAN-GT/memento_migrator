defmodule Dummy.Migrations.CreateEntities do
  @behaviour MementoMigrator.Migration

  def up(nodes) do
    Memento.Table.create Dummy.Entity, disc_copies: nodes
  end

  def down() do
    Memento.Table.delete Dummy.Entity
  end
end
