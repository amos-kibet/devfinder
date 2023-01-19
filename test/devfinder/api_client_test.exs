defmodule Devfinder.ApiClientTest do
  use ExUnit.Case
  use Devfinder.DataCase

  import Mox

  alias Devfinder.ApiClient

  setup :verify_on_exit!

  @username "octocat"

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
    created_at: "2011-01-25T18:44:36Z"
  }

  describe "GitHub User Search" do
    test "passing valid username to get_user_bio/1 returns the user's GitHub profile" do
      Devfinder.ApiClientMock
      |> expect(:get_user_bio, fn _username ->
        {:ok, @user_bio}
      end)

      result = ApiClient.get_user_bio(@username)

      assert {:ok, @user_bio} == result
    end
  end
end
