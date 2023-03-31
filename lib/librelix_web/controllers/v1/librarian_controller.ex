defmodule LibrElixWeb.V1.LibrarianController do
  use LibrElixWeb, :controller

  alias LibrElix.Library

  action_fallback LibrElixWeb.FallbackController

  def create(conn, params) do
    with {:ok, _librarian} <- Library.create_librarian(params),
         do: send_resp(conn, 200, "Librarian created.")
  end

  def sign_in(conn, params) do
    case Library.authenticate_librarian(params) do
      {:ok, token} ->
        conn
        |> put_view(LibrElixWeb.BaseView)
        |> render("response.json", token: token)

      _error ->
        {:error, :unauthorized}
    end
  end
end
