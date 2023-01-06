defmodule DevfinderWeb.PageController do
  use DevfinderWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
