defmodule LibrElix.Library.Services.AuthenticateLibrarian do
  use LibrElix, :service

  alias LibrElix.Library.Repos.Librarian, as: LibrarianRepo
  alias LibrElix.Auth.Guardian

  def process(%{"email" => email, "password" => password}) do
    with {:ok, librarian} <- LibrarianRepo.fetch_by(email: email),
         {:ok, _librarian} <- Bcrypt.check_pass(librarian, password),
         {:ok, token, _claims} <- Guardian.encode_and_sign(librarian) do
      {:ok, token}
    end
  end
end
