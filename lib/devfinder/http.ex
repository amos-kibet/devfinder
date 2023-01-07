defmodule Devfinder.Http do
  @moduledoc """
  http context for interacting with GitHub API in the following ways:

    - get GitHub user profile data using **Finch** HTTP client
    - process the received bio data & prepare the data needed by the controller
  """

  require Logger

  alias Devfinder.Http.User

  @url "https://api.github.com/users/"

  def find_dev(username) when is_binary(username) do
    url = gen_username_url(username)

    result =
      Finch.build(:get, url)
      |> Finch.request(Http)

    case result do
      {:ok, %Finch.Response{} = response} ->
        if response.status == 200 do
          response
          |> Map.get(:body)
          |> Jason.decode()
        else
          {:error, :not_found}
        end

      {:error, _error} ->
        Logger.error("Something went wrong!")
        :finch_error
    end
  end

  def get_user_data(username) do
    case find_dev(username) do
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
        Logger.info("Username does not exist! Try another")
        {:error, :not_found}
    end
  end

  defp gen_username_url(username) do
    @url <> username
  end
end
