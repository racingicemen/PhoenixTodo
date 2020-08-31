defmodule PhoenixTodo.TaskManager do
  @moduledoc """
  The TaskManager context.
  """

  import Ecto.Query, warn: false
  alias PhoenixTodo.Repo

  alias PhoenixTodo.TaskManager.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  alias PhoenixTodo.TaskManager.Status

  @doc """
  Returns the list of status.

  ## Examples

      iex> list_status()
      [%Status{}, ...]

  """
  def list_status do
    Repo.all(Status)
  end

  @doc """
  Gets a single status.

  Raises `Ecto.NoResultsError` if the Status does not exist.

  ## Examples

      iex> get_status!(123)
      %Status{}

      iex> get_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_status!(id), do: Repo.get!(Status, id)

  @doc """
  Creates a status.

  ## Examples

      iex> create_status(%{field: value})
      {:ok, %Status{}}

      iex> create_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_status(attrs \\ %{}) do
    %Status{}
    |> Status.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a status.

  ## Examples

      iex> update_status(status, %{field: new_value})
      {:ok, %Status{}}

      iex> update_status(status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_status(%Status{} = status, attrs) do
    status
    |> Status.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a status.

  ## Examples

      iex> delete_status(status)
      {:ok, %Status{}}

      iex> delete_status(status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_status(%Status{} = status) do
    Repo.delete(status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking status changes.

  ## Examples

      iex> change_status(status)
      %Ecto.Changeset{data: %Status{}}

  """
  def change_status(%Status{} = status, attrs \\ %{}) do
    Status.changeset(status, attrs)
  end

  alias PhoenixTodo.TaskManager.ToDo

  @doc """
  Returns the list of todos.

  ## Examples

      iex> list_todos()
      [%ToDo{}, ...]

  """
  def list_todos do
    Repo.all(ToDo)
  end

  @doc """
  Gets a single to_do.

  Raises `Ecto.NoResultsError` if the To do does not exist.

  ## Examples

      iex> get_to_do!(123)
      %ToDo{}

      iex> get_to_do!(456)
      ** (Ecto.NoResultsError)

  """
  def get_to_do!(id), do: Repo.get!(ToDo, id)

  @doc """
  Creates a to_do.

  ## Examples

      iex> create_to_do(%{field: value})
      {:ok, %ToDo{}}

      iex> create_to_do(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_to_do(attrs \\ %{}) do
    %ToDo{}
    |> ToDo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a to_do.

  ## Examples

      iex> update_to_do(to_do, %{field: new_value})
      {:ok, %ToDo{}}

      iex> update_to_do(to_do, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_to_do(%ToDo{} = to_do, attrs) do
    to_do
    |> ToDo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a to_do.

  ## Examples

      iex> delete_to_do(to_do)
      {:ok, %ToDo{}}

      iex> delete_to_do(to_do)
      {:error, %Ecto.Changeset{}}

  """
  def delete_to_do(%ToDo{} = to_do) do
    Repo.delete(to_do)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking to_do changes.

  ## Examples

      iex> change_to_do(to_do)
      %Ecto.Changeset{data: %ToDo{}}

  """
  def change_to_do(%ToDo{} = to_do, attrs \\ %{}) do
    ToDo.changeset(to_do, attrs)
  end
end
