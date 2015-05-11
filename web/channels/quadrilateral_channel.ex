defmodule Bugs.QuadrilateralChannel do
  use Phoenix.Channel

  def join("quadrilateral", message, socket) do
    {:ok, socket}
  end

  def join(arena, message, socket) do
    :ignore
  end

 	def handle_in("new_bug", %{"x" => x, "y" => y}, socket) do
    broadcast! socket, "new_bug", %{x: x, y: y}
    {:noreply, socket}
  end

  def handle_out("new_bug", payload, socket) do
    push socket, "new_bug", payload
    {:noreply, socket}
  end

end

