defmodule PhoenixTodo.TaskManager.ToDo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :description, :string
    field :due_datetime, :utc_datetime
    field :priority, :integer
    belongs_to :category, PhoenixTodo.TaskManager.Category
    belongs_to :status, PhoenixTodo.TaskManager.Status

    timestamps()
  end

  @doc false
  def changeset(to_do, attrs) do
    to_do
    |> cast(attrs, [:description, :priority, :due_datetime])
    |> validate_required([:description, :priority, :due_datetime])
  end
end
