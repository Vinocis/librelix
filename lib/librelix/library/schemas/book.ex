defmodule LibrElix.Library.Schemas.Book do
  use LibrElix, :schema

  @required_fields ~w(
    name
    author
    genre
    borrowed?
  )a

  @optional_fields ~w(
    synopsis
  )a

  @type book :: Book.t()

  schema "books" do
    field :name, :string
    field :author, :string
    field :genre, :string
    field :synopsis, :string
    field :borrowed?, :boolean

    timestamps()
  end

  @spec changeset(book, map) :: changeset
  def changeset(schema, attrs) do
    schema
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
