defmodule LibrElix.Repo do
  use Ecto.Repo,
    otp_app: :librelix,
    adapter: Ecto.Adapters.Postgres

  alias LibrElix.Library.Schemas.Librarian

  @type changeset :: Ecto.Changeset.t()
  @type query :: Ecto.Query.t()

  @spec fetch(module | query, integer) :: {:ok, struct} | {:error, atom}
  def fetch(source, id) do
    fetch_by(source, id: id)
  end

  @spec fetch_by(module | query, keyword) :: {:ok, struct} | {:error, atom}
  def fetch_by(source, params) do
    error = normalize_fetch_error(source)

    case LibrElix.Repo.get_by(source, params) do
      nil -> {:error, error}
      entity -> {:ok, entity}
    end
  end

  defp normalize_fetch_error(Librarian), do: :librarian_not_found
  defp normalize_fetch_error(_source), do: :not_found
end
