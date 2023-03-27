defmodule LibrElix.Library.Repos.LibrarianTest do
  use LibrElix.DataCase

  alias LibrElix.Factory
  alias LibrElix.Library.Repos.Librarian, as: LibrarianRepo

  describe "fetch/1" do
    test "return a success tuple with the librarian when found" do
      librarian = Factory.insert(:librarian)

      assert {:ok, target} = LibrarianRepo.fetch(librarian.id)
      assert target.id == librarian.id
      assert target.password_hash == librarian.password_hash
    end

    test "return an error tuple when librarian does not exists" do
      Factory.insert(:librarian)

      assert {:error, error} = LibrarianRepo.fetch(1)
      assert error == :librarian_not_found
    end
  end

  describe "fetch_by/1" do
    test "return a success tuple with the librarian when found" do
      librarian = Factory.insert(:librarian)

      assert {:ok, target} = LibrarianRepo.fetch_by(name: "Lee Bryan")
      assert target.id == librarian.id
      assert target.password_hash == librarian.password_hash
    end

    test "return an error tuple when librarian does not exists" do
      Factory.insert(:librarian)

      assert {:error, error} = LibrarianRepo.fetch_by(name: "Jhon")
      assert error == :librarian_not_found
    end
  end

  describe "insert/1" do
    test "returns the created librarian when changeset is valid" do
      attrs = Factory.params_for(:librarian, email: "librarian@librelix.com")
      {:ok, librarian} = LibrarianRepo.insert(attrs)

      assert librarian.name == "Lee Bryan"
      assert librarian.email == "librarian@librelix.com"
    end

    test "with invalid params, returns the changeset" do
      attrs = Factory.params_for(:librarian, email: nil)
      {:error, changeset} = LibrarianRepo.insert(attrs)

      assert errors_on(changeset) == %{email: ["can't be blank"]}
    end
  end
end
