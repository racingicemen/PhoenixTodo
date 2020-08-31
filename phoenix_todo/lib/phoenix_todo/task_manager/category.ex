defmodule PhoenixTodo.TaskManager.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :description, :string, null: false

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
