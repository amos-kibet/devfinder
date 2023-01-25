defmodule Devfinder.ApiClientTest do
  use ExUnit.Case
  use Devfinder.DataCase

  import Mox

  alias Devfinder.ApiClient

  setup :verify_on_exit!
  setup :set_mox_from_context

  @username "octocat"

  def api_client, do: Application.get_env(:devfinder, :api_client)

  def http_client, do: Application.get_env(:devfinder, :http_client)

  def get_user_bio(username) do
    api_client().get_user_bio(username)
  end

  def find_dev(username) do
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
    test "passing valid username to get_user_bio/1 returns the user's GitHub profile" do
      Devfinder.ApiClientMock
      |> expect(:get_user_bio, fn @username ->
        {:ok, @user_bio}
      end)

      Devfinder.HttpClientMock
      |> expect(:find_dev, fn @username ->
        {:ok, @user_bio}
      end)

      result = ApiClient.get_user_bio(@username)

      assert {:ok, @user_bio} == result
    end
  end
end
