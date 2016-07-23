defmodule PhoenixTodosApi.PageController do
  use PhoenixTodosApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
