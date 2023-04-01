defmodule LibrElix.Library.Repos.Book do
  use LibrElix, :repo

  alias LibrElix.Library.Schemas.Book

  @type book :: Book.t()

  @spec insert(map) :: {:ok, book} | {:error, changeset}
  def insert(attrs) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end
end
