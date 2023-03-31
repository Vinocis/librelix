defmodule LibrelixWeb.V1.LibrarianControllerTest do
  use LibrElixWeb.ConnCase, async: true

  setup :put_basic_auth_credentials

  describe "create/2" do
    test "create librarian with valid params", %{conn: conn} do
      params = Factory.params_for(:librarian)

      conn = post(conn, "/v1/librarians", params)

      assert response(conn, 200)
      assert conn.resp_body == "Librarian created."
    end

    test "do not create librarian with invalid params", %{conn: conn} do
      params = %{
        email: "librarian-0@librelix.com",
        name: "Lee Bryan"
      }

      conn = post(conn, "/v1/librarians", params)

      assert json_response(conn, 422)["errors"] == %{"detail" => "Unprocessable Entity"}
    end
  end

  describe "sign_in/2" do
    setup context do
      credentials = [email: "lee_bryan@librelix.com", password: "123456"]

      Map.put(context, :credentials, credentials)
    end

    test "return a jwt token with valid credentials", %{conn: conn, credentials: credentials} do
      Factory.insert(:librarian, credentials)

      conn = post(conn, "/v1/librarians/sign_in", credentials)

      assert json_response(conn, 200)["token"]
    end

    test "adasd", %{conn: conn, credentials: credentials} do
      conn = post(conn, "/v1/librarians/sign_in", credentials)

      assert json_response(conn, 401)["errors"] == %{"detail" => "Unauthorized"}
    end
  end
end
