defmodule DevfinderWeb.UserLive.Index do
  use DevfinderWeb, :live_view

  require Logger

  alias Devfinder.Core

  @impl true
  def mount(_params, _session, socket) do
    send(self(), :retrieve_user_bio)

    {:ok,
     socket
     |> assign(:current_theme, "light")
     |> assign(:user_bio, get_user_bio("octocat"))}
    |> IO.inspect(label: "[MOUNT SOCKET")
  end

  @impl true
  def handle_info(:retrieve_user_bio, socket) do
    IO.inspect(socket, label: "[HANDLE_INFO SOCKET]")

    user_bio = Core.retrieve_user_bio(socket.assigns.user_bio.username)
    IO.inspect(user_bio, label: "[HANDLE_INFO USER_BIO]")

    {:noreply, socket}
  end

  @impl true
  def handle_event("search", %{"user_bio" => %{"username" => username}} = _user_params, socket) do
    case get_user_bio(username) do
      :not_found ->
        {:noreply,
         socket
         |> put_flash(:info, "Username not found! Try another")
         |> assign(:user_bio, get_user_bio("octocat"))}

      user_bio ->
        {:noreply, assign(socket, :user_bio, user_bio)}
    end
  end

  def handle_event("toggle_current_theme", _params, socket) do
    case socket.assigns.current_theme do
      "dark" ->
        {:noreply, assign(socket, :current_theme, "light")}

      "light" ->
        {:noreply, assign(socket, :current_theme, "dark")}
    end
  end

  def get_user_bio(username) do
    case Core.get_user_bio(username) do
      {:error, :finch_error} ->
        Logger.error("Something went wrong! Retrying")

        # FIXME: use recursion here as below
        get_user_bio(username)

      {:error, :not_found} ->
        Logger.info("Username not found! Try another")
        :not_found

      {:ok, user} ->
        user
    end
  end
end
