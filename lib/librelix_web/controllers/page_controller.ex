defmodule LibrElixWeb.PageController do
  use LibrElixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
