defmodule DevfinderWeb.UserLive.Index do
  use DevfinderWeb, :live_view

  require Logger

  alias Devfinder.Core

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:current_theme, "light")
     |> assign(:user_bio, default_user_bio())}
  end

  @impl true
  def handle_event("search", %{"user_bio" => %{"username" => username}} = _user_params, socket) do
    case get_user_bio(username) do
      :not_found ->
        {:noreply,
         socket
         |> put_flash(:info, "Username not found!")
         |> assign(:user_bio, default_user_bio())}

      user_bio ->
        {:noreply, assign(socket, :user_bio, user_bio)}
    end
  end

  def handle_event("toggle_current_theme", _params, socket) do
    if socket.assigns.current_theme == "dark" do
      {:noreply, assign(socket, :current_theme, "light")}
    else
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
        Logger.info("Username not found!")
        :not_found

      {:ok, user} ->
        user
    end
  end

  defp default_user_bio do
    %{
      full_name: "Amos Kibet",
      avatar_url: "https://avatars.githubusercontent.com/u/50356453?v=4",
      username: "amos-kibet",
      profile_url: "https://github.com/amos-kibet",
      bio: "Fullstack Elixir developer",
      location: "Nairobi, Kenya",
      twitter_username: "@amos_kibet",
      company: "Amozone Labs",
      blog: "https://www.amozone.blog",
      created_at: "7 May 2019",
      profile_stats: %{
        public_repos: "107",
        followers: "32",
        following: "156"
      }
    }
  end
end
