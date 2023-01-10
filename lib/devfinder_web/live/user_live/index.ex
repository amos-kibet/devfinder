defmodule DevfinderWeb.UserLive.Index do
  use DevfinderWeb, :live_view

  require Logger

  alias Devfinder.Core
  alias Devfinder.Http.User

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :user_bio, %User{})}
  end

  @impl true
  def handle_event("search", %{"user_bio" => %{"username" => username}} = _user_params, socket) do
    case get_user(username) do
      :finch_error ->
        Logger.error("Something went wrong!")
        {:noreply, socket}
      :not_found ->
        Logger.info("Username not found!")
        {:noreply, socket}

      user_bio ->
        {:noreply, assign(socket, :user_bio, user_bio)}
    end
  end

  def get_user(username) do
    case Core.get_user(username) do
      {:error, :finch_error} ->
        Logger.error("Something went wrong!")
        :finch_error
      {:error, :not_found} ->
        Logger.info("Username not found!")
        :not_found
      {:ok, user} ->
        user
    end
  end
end
