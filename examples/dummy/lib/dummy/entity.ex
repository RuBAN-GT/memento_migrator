defmodule Dummy.Entity do
  use Memento.Table,
    attributes: [:id, :prop],
    type: :ordered_set,
    autoincrement: true
end
