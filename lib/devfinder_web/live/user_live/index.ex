defmodule DevfinderWeb.UserLive.Index do
  use DevfinderWeb, :live_view

  require Logger

  alias Devfinder.Core

  @impl true
  def mount(_params, _session, socket) do
    user_bio = get_user_bio("octocat")
    {:ok, assign(socket, :user_bio, user_bio)}
  end

  @impl true
  def handle_event("search", %{"user_bio" => %{"username" => username}} = _user_params, socket) do
    case get_user_bio(username) do
      :not_found ->
        {:noreply, socket}

      user_bio ->
        {:noreply, assign(socket, :user_bio, user_bio)}
    end
  end

  def get_user_bio(username) do
    case Core.get_user_bio(username) do
      {:error, :finch_error} ->
        Logger.error("Something went wrong! Retrying")
        Core.get_user_bio(username)

      {:error, :not_found} ->
        Logger.info("Username not found! Try another")
        :not_found

      {:ok, user} ->
        user
    end
  end
end
