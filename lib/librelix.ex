defmodule LibrElix do
  @moduledoc """
  Defines a `using` macro with a context's standard behaviour
  """

  defmacro __using__(context) when is_atom(context) do
    apply(__MODULE__, context, [])
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
end
