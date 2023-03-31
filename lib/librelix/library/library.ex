defmodule LibrElix.Library do
  @moduledoc """
  This module is a facade so the other contexts can access the 
  Library's context functionalities
  """

  alias LibrElix.Library.Repos.Librarian, as: LibrarianRepo

  alias LibrElix.Library.Services.AuthenticateLibrarian

  defdelegate fetch_librarian(id), to: LibrarianRepo, as: :fetch
  defdelegate create_librarian(id), to: LibrarianRepo, as: :insert
  defdelegate authenticate_librarian(params), to: AuthenticateLibrarian, as: :process
end
