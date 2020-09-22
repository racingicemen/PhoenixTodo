defmodule PhoenixTodo.TaskManager.ToDo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :description, :string
    field :due_datetime, :utc_datetime
    field :priority, :integer
    belongs_to :category, PhoenixTodo.TaskManager.Category
    belongs_to :status, PhoenixTodo.TaskManager.Status

    timestamps(inserted_at: :create_datetime, updated_at: :update_datetime)
  end

  @doc false
  def changeset(to_do, attrs) do
    to_do
    |> cast(attrs, [:description, :priority, :category_id, :status_id, :due_datetime])
    |> validate_required([:description, :priority, :due_datetime])
    |> assoc_constraint(:category)
    |> assoc_constraint(:status)
  end
end
