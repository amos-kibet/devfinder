defmodule DevfinderWeb.UserLive.Index do
  use DevfinderWeb, :live_view

  require Logger

  alias Devfinder.Core

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:current_theme, "light")
     |> assign(:user_bio, get_user_bio("octocat"))}
    |> IO.inspect(label: "[MOUNT SOCKET")
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

        # FIXME: use recursion here for retries, but keep in mind not being rate-limited
        get_user_bio(username)

      {:error, :not_found} ->
        Logger.info("Username not found! Try another")
        :not_found

      {:ok, user} ->
        user
    end
  end
end
