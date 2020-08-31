defmodule PhoenixTodo.TaskManager.Status do
  use Ecto.Schema
  import Ecto.Changeset

  schema "status" do
    field :description, :string, null: false

    timestamps()
  end

  @doc false
  def changeset(status, attrs) do
    status
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
