defmodule Devfinder.HttpClientTest do
  use ExUnit.Case
  use Devfinder.DataCase

  import Mox

  @username "octocat"

  def http_client, do: Application.get_env(:devfinder, :http_client)

  def find_dev(username) do
    IO.puts("[TEST HTTP_CLIENT CALLED]")
    http_client().find_dev(username)
  end

  @user_bio %{
    login: "octocat",
    avatar_url: "https://avatars.githubusercontent.com/u/583231?v=4",
    html_url: "https://github.com/octocat",
    name: "The Octocat",
    company: "@github",
    blog: "https://github.blog",
    location: "San Francisco",
    bio: nil,
    twitter_username: nil,
    public_repos: 8,
    followers: 8075,
    following: 9,
    created_at: "7 May 2019"
  }

  describe "GitHub User Search" do
    test "passing valid username to find_dev/1 returns the user's GitHub profile" do
      Devfinder.HttpClientMock
      |> expect(:find_dev, fn @username ->
        {:ok, @user_bio}
      end)

      result = find_dev(@username)

      assert {:ok, @user_bio} == result
    end
  end
end
