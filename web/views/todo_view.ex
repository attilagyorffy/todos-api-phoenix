defmodule PhoenixTodosApi.TodoView do
  use PhoenixTodosApi.Web, :view
  use JaSerializer.PhoenixView

  attributes [:title, :is_completed]
end
