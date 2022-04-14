defmodule LiveClocksWeb.PageController do
  use LiveClocksWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
