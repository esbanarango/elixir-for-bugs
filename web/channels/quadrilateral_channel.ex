defmodule Bugs.QuadrilateralChannel do
  use Phoenix.Channel

  def join("quadrilateral", message, socket) do
    {:ok, socket}
  end

  def join(arena, message, socket) do
    :ignore
  end

end

