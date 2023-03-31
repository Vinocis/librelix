defmodule LibrElix do
  @moduledoc """
  LibrElix keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def service do
    quote do
      @behaviour LibrElix.ServiceBehaviour
    end
  end

  def repo do
    quote do
      alias LibrElix.Repo

      @type changeset :: Ecto.Changeset.t()
      @type query :: Ecto.Query.t()
    end
  end

  def schema do
    quote do
      use Ecto.Schema

      import Ecto.Changeset

      @type changeset :: Ecto.Changeset.t()
    end
  end

  defmacro __using__(context) when is_atom(context) do
    apply(__MODULE__, context, [])
  end
end
