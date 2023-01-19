defmodule Devfinder.ApiClient do
  @moduledoc false
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
  end
end
