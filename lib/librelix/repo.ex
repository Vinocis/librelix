defmodule LibrElix.Repo do
  use Ecto.Repo,
    otp_app: :librelix,
    adapter: Ecto.Adapters.Postgres
end
