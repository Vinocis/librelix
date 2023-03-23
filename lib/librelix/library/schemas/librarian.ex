defmodule LibrElix.Library.Schemas.Librarian do
  use LibrElix, :schema

  @required_fields ~w(
    name
    email
  )a

  @optional_fields ~w(
    password
  )a

  @type librarian :: Librarian.t()

  schema "librarians" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @spec changeset(librarian, map) :: changeset
  def changeset(schema, attrs) do
    schema
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:email)
    |> maybe_hash_password()
  end

  defp maybe_hash_password(
         %Ecto.Changeset{
           valid?: true,
           changes: %{password: password}
         } = changeset
       ) do
    hashed_password = Bcrypt.add_hash(password)

    change(changeset, hashed_password)
  end

  defp maybe_hash_password(changeset), do: changeset
end
