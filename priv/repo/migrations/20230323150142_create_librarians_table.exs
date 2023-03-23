defmodule LibrElix.Repo.Migrations.CreateLibrariansTable do
  use Ecto.Migration

  def change do
    create table(:librarians) do
      add :name, :string, null: false
      add :email, :string, null: false
      add :password_hash, :string, null: false

      timestamps()
    end

    create unique_index(:librarians, [:email])
  end
end
