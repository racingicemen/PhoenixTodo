defmodule PhoenixTodo.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :description, :string
      add :priority, :integer
      add :due_datetime, :utc_datetime
      add :category_id, references(:categories, on_delete: :nothing)
      add :status_id, references(:status, on_delete: :nothing)

      timestamps(inserted_at: :create_datetime, updated_at: :update_datetime)
    end

    create index(:todos, [:category_id])
    create index(:todos, [:status_id])
  end
end
