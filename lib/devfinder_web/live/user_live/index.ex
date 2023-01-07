defmodule DevfinderWeb.UserLive.Index do
  use DevfinderWeb, :live_view

  alias Devfinder.Core
  # alias Devfinder.Http.User

  @impl true
  def mount(_params, _session, socket) do
    hardcoded = "amos-kibet"

    {:ok, assign(socket, :user_bio, get_user(hardcoded))}
    |> IO.inspect(label: "[INDEX MOUNT SOCKET]")
  end

  # @impl true
  # def handle_params(params, _url, socket) do
  #   {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  # end

  # defp apply_action(socket, :edit, %{"id" => id}) do
  #   socket
  #   |> assign(:page_title, "Edit User")
  #   |> assign(:user, Core.get_user!(id))
  # end

  # defp apply_action(socket, :search, _params) do
  #   socket
  #   |> assign(:page_title, "Search User")
  #   |> assign(:user, %User{})
  # end

  # defp apply_action(socket, :index, _params) do
  #   socket
  #   |> assign(:page_title, "Devfinder User Bio")
  #   |> assign(:user, nil)
  # end

  # @impl true
  # def handle_event("delete", %{"id" => id}, socket) do
  #   user = Core.get_user!(id)
  #   {:ok, _} = Core.delete_user(user)

  #   {:noreply, assign(socket, :users, list_users())}
  # end

  def get_user(params) do
    {:ok, user} = Core.get_user(params)

    user
  end
end
