defmodule PhoenixTodoWeb.TodoController do
  use PhoenixTodoWeb, :controller

  alias PhoenixTodo.TaskManager
  alias PhoenixTodo.TaskManager.ToDo

  plug :load_categories when action in [:new, :create, :edit, :update]
  plug :load_statuses when action in [:new, :create, :edit, :update]

  def action(conn, _) do
    args = [conn, conn.params]
    apply(__MODULE__, action_name(conn), args)
  end

  def index(conn, _params) do
    todos = TaskManager.list_todos()
    render(conn, "index.html", todos: todos)
  end

  def new(conn, _params) do
    changeset = TaskManager.change_to_do(%ToDo{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"to_do" => todo_params}) do
    case TaskManager.create_to_do(todo_params) do
      {:ok, todo} ->
        conn
        |> put_flash(:info, "ToDo created successfully.")
        |> redirect(to: Routes.todo_path(conn, :show, todo))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.puts("what the fuck is still going on?")
        IO.inspect(changeset)
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todo = TaskManager.get_to_do!(id)
    IO.puts("I got the fuck here")
    render(conn, "show.html", todo: todo)
  end

  defp load_categories(conn, _) do
    assign(conn, :categories, TaskManager.list_alphabetical_categories())
  end

  defp load_statuses(conn, _) do
    assign(conn, :statuses, TaskManager.list_status())
  end

end
