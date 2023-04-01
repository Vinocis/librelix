defmodule LibrElix.Factory do
  use ExMachina.Ecto, repo: LibrElix.Repo

  alias LibrElix.Library.Schemas.Librarian
  alias LibrElix.Library.Schemas.Book

  def librarian_factory(attrs) do
    attrs = handle_librarian_password(attrs)

    librarian = %Librarian{
      name: "Lee Bryan",
      email: sequence(:email, &"librarian-#{&1}@librelix.com")
    }

    librarian
    |> merge_attributes(attrs)
    |> evaluate_lazy_attributes()
  end

  defp handle_librarian_password(attrs) do
    password = Map.get(attrs, :password, gen_password(100..1000))
    hashed_password = Bcrypt.hash_pwd_salt(password)

    attrs
    |> Map.put(:password, password)
    |> Map.put(:password_hash, hashed_password)
  end

  defp gen_password(range) do
    range
    |> Enum.random()
    |> Integer.to_string()
  end

  def book_factory() do
    %Book{
      name: "Very Creative Name Here",
      author: "Robson",
      genre: "Sci-fi",
      synopsis: "Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.",
      borrowed?: false
    }
  end
end
