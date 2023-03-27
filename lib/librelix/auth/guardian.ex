defmodule LibrElix.Auth.Guardian do
  use Guardian, otp_app: :librelix

  alias LibrElix.Library

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)

    {:ok, sub}
  end

  def subject_for_token(_, _), do: {:error, :unable_to_make_sub}

  def resource_from_claims(%{"sub" => id}), do: Library.fetch_librarian(id)
  def resource_from_claims(_claims), do: {:error, :resource_not_found}
end
