defmodule LibrElix.Library do
  @moduledoc """
  A facade module for all the other contexts inside
  the Library context
  """

  alias LibrElix.Library.Repo.Librarian, as: LibrarianRepo

  defdelegate fetch_librarian(id), to: LibrarianRepo, as: :fetch
end
