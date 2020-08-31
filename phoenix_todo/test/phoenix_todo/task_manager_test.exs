defmodule PhoenixTodo.TaskManagerTest do
  use PhoenixTodo.DataCase

  alias PhoenixTodo.TaskManager

  describe "categories" do
    alias PhoenixTodo.TaskManager.Category

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TaskManager.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert TaskManager.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert TaskManager.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = TaskManager.create_category(@valid_attrs)
      assert category.description == "some description"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskManager.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = TaskManager.update_category(category, @update_attrs)
      assert category.description == "some updated description"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskManager.update_category(category, @invalid_attrs)
      assert category == TaskManager.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = TaskManager.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> TaskManager.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = TaskManager.change_category(category)
    end
  end

  describe "status" do
    alias PhoenixTodo.TaskManager.Status

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def status_fixture(attrs \\ %{}) do
      {:ok, status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TaskManager.create_status()

      status
    end

    test "list_status/0 returns all status" do
      status = status_fixture()
      assert TaskManager.list_status() == [status]
    end

    test "get_status!/1 returns the status with given id" do
      status = status_fixture()
      assert TaskManager.get_status!(status.id) == status
    end

    test "create_status/1 with valid data creates a status" do
      assert {:ok, %Status{} = status} = TaskManager.create_status(@valid_attrs)
      assert status.description == "some description"
    end

    test "create_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskManager.create_status(@invalid_attrs)
    end

    test "update_status/2 with valid data updates the status" do
      status = status_fixture()
      assert {:ok, %Status{} = status} = TaskManager.update_status(status, @update_attrs)
      assert status.description == "some updated description"
    end

    test "update_status/2 with invalid data returns error changeset" do
      status = status_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskManager.update_status(status, @invalid_attrs)
      assert status == TaskManager.get_status!(status.id)
    end

    test "delete_status/1 deletes the status" do
      status = status_fixture()
      assert {:ok, %Status{}} = TaskManager.delete_status(status)
      assert_raise Ecto.NoResultsError, fn -> TaskManager.get_status!(status.id) end
    end

    test "change_status/1 returns a status changeset" do
      status = status_fixture()
      assert %Ecto.Changeset{} = TaskManager.change_status(status)
    end
  end

  describe "todos" do
    alias PhoenixTodo.TaskManager.ToDo

    @valid_attrs %{description: "some description", due_datetime: "2010-04-17T14:00:00Z", priority: 42}
    @update_attrs %{description: "some updated description", due_datetime: "2011-05-18T15:01:01Z", priority: 43}
    @invalid_attrs %{description: nil, due_datetime: nil, priority: nil}

    def to_do_fixture(attrs \\ %{}) do
      {:ok, to_do} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TaskManager.create_to_do()

      to_do
    end

    test "list_todos/0 returns all todos" do
      to_do = to_do_fixture()
      assert TaskManager.list_todos() == [to_do]
    end

    test "get_to_do!/1 returns the to_do with given id" do
      to_do = to_do_fixture()
      assert TaskManager.get_to_do!(to_do.id) == to_do
    end

    test "create_to_do/1 with valid data creates a to_do" do
      assert {:ok, %ToDo{} = to_do} = TaskManager.create_to_do(@valid_attrs)
      assert to_do.description == "some description"
      assert to_do.due_datetime == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert to_do.priority == 42
    end

    test "create_to_do/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskManager.create_to_do(@invalid_attrs)
    end

    test "update_to_do/2 with valid data updates the to_do" do
      to_do = to_do_fixture()
      assert {:ok, %ToDo{} = to_do} = TaskManager.update_to_do(to_do, @update_attrs)
      assert to_do.description == "some updated description"
      assert to_do.due_datetime == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert to_do.priority == 43
    end

    test "update_to_do/2 with invalid data returns error changeset" do
      to_do = to_do_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskManager.update_to_do(to_do, @invalid_attrs)
      assert to_do == TaskManager.get_to_do!(to_do.id)
    end

    test "delete_to_do/1 deletes the to_do" do
      to_do = to_do_fixture()
      assert {:ok, %ToDo{}} = TaskManager.delete_to_do(to_do)
      assert_raise Ecto.NoResultsError, fn -> TaskManager.get_to_do!(to_do.id) end
    end

    test "change_to_do/1 returns a to_do changeset" do
      to_do = to_do_fixture()
      assert %Ecto.Changeset{} = TaskManager.change_to_do(to_do)
    end
  end
end
