defmodule LibrElix.Repo.Migrations.CreateBooksTable do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :name, :string, null: false
      add :author, :string, null: false
      add :genre, :string, null: false
      add :synopsis, :text
      add :borrowed?, :boolean, null: false

      timestamps()
    end

    create index(:books, [:name])
    create index(:books, [:author])
    create index(:books, [:genre])
  end
end
