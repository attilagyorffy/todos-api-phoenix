defmodule PhoenixTodosApi.Todo do
  use PhoenixTodosApi.Web, :model

  schema "todos" do
    field :title, :string
    field :is_completed, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :is_completed])
    |> validate_required([:title, :is_completed])
  end
end
