defmodule LibrElix.Library.Repo.Librarian do
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

  @spec update(librarian, map) :: {:ok, librarian} | {:error, changeset}
  def update(librarian, attrs) do
    librarian
    |> Librarian.changeset(attrs)
    |> Repo.update()
  end

  @spec delete(librarian) :: {:ok, librarian} | {:error, changeset}
  def delete(librarian), do: Repo.delete(librarian)
end
