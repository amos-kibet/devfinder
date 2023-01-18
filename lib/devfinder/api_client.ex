defmodule Devfinder.ApiClient do
  @moduledoc """
  http context for interacting with GitHub API in the following ways:

    - get GitHub user profile data using **Finch** HTTP client
    - process the received bio data & prepare the data needed by the controller
  """
  alias Devfinder.ApiClient.User

  @behaviour Devfinder.ApiClientBehaviour

  def http_adapter, do: Application.get_env(:devfinder, :http_client)

  def get_user_bio(username) do
    case http_adapter().find_dev(username) do
      {:ok, bio} ->
        dev_bio = %User{
          full_name: bio["name"],
          avatar_url: bio["avatar_url"],
          username: bio["login"],
          profile_url: bio["html_url"],
          bio: bio["bio"],
          location: bio["location"],
          twitter_username: bio["twitter_username"],
          company: bio["company"],
          blog: bio["blog"],
          created_at: bio["created_at"],
          profile_stats: %{
            public_repos: "#{bio["public_repos"]}",
            followers: "#{bio["followers"]}",
            following: "#{bio["following"]}"
          }
        }

        {:ok, dev_bio}

      {:error, :not_found} ->
        {:error, :not_found}

      {:error, _error} ->
        {:error, :finch_error}
    end

    # dev_bio = %User{
    #   full_name: "Amos Kibet",
    #   avatar_url: "https://avatars.githubusercontent.com/u/583231?v=4",
    #   username: "amos-kibet",
    #   profile_url: "https://github.com/amos-kibet",
    #   bio: "Elixir developer",
    #   location: "Nairobi, Kenya",
    #   twitter_username: "@amos_kibet",
    #   company: nil,
    #   blog: nil,
    #   created_at: DateTime.utc_now() |> DateTime.to_date(),
    #   profile_stats: %{
    #     public_repos: "100",
    #     followers: "100",
    #     following: "100"
    #   }
    # }
  end
end
