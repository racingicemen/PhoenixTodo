defmodule PhoenixTodo.Repo.Migrations.CreateStatus do
  use Ecto.Migration

  def change do
    create table(:status) do
      add :description, :string

      timestamps()
    end

  end
end