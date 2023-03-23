defmodule LibrElix.Library.Schemas.LibrarianTest do
  use LibrElix.DataCase

  alias LibrElix.Library.Schemas.Librarian

  describe "changeset/2" do
    test "hashes the librarian password" do
      attrs = Factory.params_for(:librarian, email: "librarian@librelix.com")
      changeset = Librarian.changeset(%Librarian{}, attrs)

      assert %{password_hash: _hash} = changeset.changes
      assert changeset.valid?
    end

    test "does not hashes the password with invalid attrs" do
      attrs = %{email: nil, name: "Lee Bryan", password: "12345"}
      changeset = Librarian.changeset(%Librarian{}, attrs)

      refute changeset.valid?
      refute Map.has_key?(changeset.changes, :password_hash)
      assert errors_on(changeset) == %{email: ["can't be blank"]}
    end
  end
end
