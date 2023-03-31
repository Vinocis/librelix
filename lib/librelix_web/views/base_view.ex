defmodule LibrElixWeb.BaseView do
  use LibrElixWeb, :view

  def render("response.json", data) do
    Map.delete(data, :conn)
  end
end
