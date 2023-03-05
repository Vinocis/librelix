defmodule LibrElix.Library.Repo.LibrarianTest do
  use LibrElix.DataCase

  alias LibrElix.Factory
  alias LibrElix.Library.Repo.Librarian, as: LibrarianRepo

  describe "fetch/1" do
    test "return a success tuple with the librarian when found" do
      librarian = Factory.insert(:librarian)

      assert {:ok, target} = LibrarianRepo.fetch(librarian.id)
      assert target == librarian
    end

    test "return an error tuple when librarian does not exists" do
      Factory.insert(:librarian)

      assert {:error, error} = LibrarianRepo.fetch(1)
      assert error == :librarian_not_found
    end
  end

  describe "fetch_by/1" do
    test "return a success tuple with the librarian when found" do
      librarian = Factory.insert(:librarian, name: "Fulano")

      assert {:ok, target} = LibrarianRepo.fetch_by(name: "Fulano")
      assert target == librarian
    end

    test "return an error tuple when librarian does not exists" do
      Factory.insert(:librarian)

      assert {:error, error} = LibrarianRepo.fetch_by(name: "Fulano")
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

  describe "update/1" do
    test "returns the updated librarian when changeset is valid" do
      librarian = Factory.insert(:librarian)
      attrs = Factory.params_for(:librarian, name: "Jhon")

      assert librarian.name == "Lee Bryan"

      assert {:ok, librarian} = LibrarianRepo.update(librarian, attrs)
      assert librarian.name == "Jhon"
    end

    test "with invalid params, returns the changeset" do
      librarian = Factory.insert(:librarian)
      attrs = Factory.params_for(:librarian, name: ["name"])

      assert {:error, changeset} = LibrarianRepo.update(librarian, attrs)
      assert errors_on(changeset) == %{name: ["is invalid"]}
    end
  end
end
