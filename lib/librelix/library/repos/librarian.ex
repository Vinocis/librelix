defmodule LibrElix.Library.Repos.Librarian do
  use LibrElix, :repo

  alias LibrElix.Library.Schemas.Librarian

  @type librarian :: Librarian.t()

  @spec fetch(integer) :: {:ok, librarian} | {:error, :librarian_not_found}
  def fetch(id), do: Repo.fetch(Librarian, id)

  @spec fetch_by(keyword) :: {:ok, librarian} | {:error, :librarian_not_found}
  def fetch_by(params), do: Repo.fetch_by(Librarian, params)

  @spec insert(map) :: {:ok, librarian} | {:error, changeset}
  def insert(attrs) do
    %Librarian{}
    |> Librarian.changeset(attrs)
    |> Repo.insert()
  end
end
