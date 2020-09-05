# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixTodo.Repo.insert!(%PhoenixTodo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias PhoenixTodo.TaskManager

for category <- ~w(Orange Yellow Green Blue Indigo Violet) do
  TaskManager.create_category!(category)
end
