defmodule LibrElixWeb.FallbackController do
  use LibrElixWeb, :controller

  alias LibrElixWeb.ErrorView

  @not_found_errors ~w(
    :not_found
    :librarian_not_found
  )a

  def call(conn, {:error, error}) when error in @not_found_errors do
    conn
    |> put_status(404)
    |> put_view(ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(401)
    |> put_view(ErrorView)
    |> render(:"401")
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(422)
    |> put_view(ErrorView)
    |> render("422.json", changeset: changeset)
  end
end
