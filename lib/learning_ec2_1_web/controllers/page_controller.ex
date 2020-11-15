defmodule LearningEc21Web.PageController do
  use LearningEc21Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
