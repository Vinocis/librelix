defmodule Librelix.Library do
  @moduledoc """
  This module is a facade so the other contexts can access the 
  Library's context functionalities
  """

  alias LibrElix.Library.Repos.Librarian, as: LibrarianRepo

  defdelegate fetch_librarian(id), to: LibrarianRepo, as: :fetch
end
