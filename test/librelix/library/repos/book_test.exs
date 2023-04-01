defmodule LibrElix.Library.Repos.BookTest do
  use LibrElix.DataCase

  alias LibrElix.Library.Repos.Book, as: BookRepo

  describe "insert/1" do
    test "returns the created book when changeset is valid" do
      attrs = Factory.params_for(:book)
      
      assert {:ok, book} = BookRepo.insert(attrs)
      assert book.name == "Very Creative Name Here"
      assert book.author == "Robson"
      assert book.genre == "Sci-fi"
      assert book.borrowed? == false
    end

    test "with invalid params, returns the changeset" do
      attrs = Factory.params_for(:book, name: nil)

      assert {:error, changeset} = BookRepo.insert(attrs)
      assert errors_on(changeset) == %{name: ["can't be blank"]}
    end
  end
end
