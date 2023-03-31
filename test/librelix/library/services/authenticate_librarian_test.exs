defmodule Librelix.Library.Services.AuthenticateLibrarianTest do
  use LibrElix.DataCase, async: true

  alias LibrElix.Library.Services.AuthenticateLibrarian

  setup do
    %{"email" => "lee_bryan@librelix.com", "password" => "123456"}
  end

  describe "process/1" do
    test "when librarian exists and the password matches",
         %{"email" => email, "password" => pass} = credentials do
      Factory.insert(:librarian, email: email, password: pass)

      assert {:ok, _token} = AuthenticateLibrarian.process(credentials)
    end

    test "when librarian exists but the password do not match",
         %{"email" => email} = credentials do
      Factory.insert(:librarian, email: email, password: "another_password")

      assert AuthenticateLibrarian.process(credentials) == {:error, "invalid password"}
    end

    test "when librarian does not exists", credentials do
      assert AuthenticateLibrarian.process(credentials) == {:error, :librarian_not_found}
    end
  end
end
