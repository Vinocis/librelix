defmodule LibrElix.Repo.Migrations.CreateLibrariansTable do
  use Ecto.Migration

  def change do
    create table :librarians do
      add :name, :string
      add :email, :string
      add :password_hash, :string

      timestamps()
    end
  end
end
