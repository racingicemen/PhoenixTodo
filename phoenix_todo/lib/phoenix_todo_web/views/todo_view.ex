defmodule PhoenixTodoWeb.TodoView do
  use PhoenixTodoWeb, :view

  def category_select_options(categories) do
    for category <- categories, do: {category.description, category.id}
  end

  def status_select_options(statuses) do
    for status <- statuses, do: {status.description, status.id}
  end
end
