defmodule PhoenixTodosApi.TodoController do
  use PhoenixTodosApi.Web, :controller

  alias PhoenixTodosApi.Todo

  def index(conn, _params) do
    todos = Repo.all(Todo)
    render(conn, "index.json-api", data: todos)
  end

  def create(conn, %{"data" => todo_params}) do
    %Todo{}
    |> Todo.changeset(create_or_update_params(todo_params))
    |> Repo.insert
    |> case do
      {:ok, todo} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", todo_path(conn, :show, todo))
        |> render("show.json-api", data: todo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixTodosApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todo = Repo.get!(Todo, id)
    render(conn, "show.json-api", data: todo)
  end

  def update(conn, %{"id" => id, "data" => todo_params}) do
    todo = Repo.get!(Todo, id)


    Todo.changeset(todo, create_or_update_params(todo_params))
    |> Repo.update
    |> case do
      {:ok, todo} ->
        render(conn, "show.json-api", data: todo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixTodosApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = Repo.get!(Todo, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(todo)

    send_resp(conn, :no_content, "")
  end

  defp create_or_update_params(params) do
    params
    |> JaSerializer.Params.to_attributes
    |> Map.take(["title", "is-completed"])
  end
end
