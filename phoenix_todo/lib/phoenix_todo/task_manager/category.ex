defmodule PhoenixTodo.TaskManager.Category do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

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

  def alphabetical(query) do
    from c in query, order_by: c.description
  end
end
