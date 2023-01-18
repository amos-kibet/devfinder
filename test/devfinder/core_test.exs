defmodule Devfinder.CoreTest do
  use Devfinder.DataCase

  import Mox

  setup :verify_on_exit!

  @username "octocat"

  @user_bio %{
      "login": "octocat",
      "avatar_url": "https://avatars.githubusercontent.com/u/583231?v=4",
      "html_url": "https://github.com/octocat",
      "name": "The Octocat",
      "company": "@github",
      "blog": "https://github.blog",
      "location": "San Francisco",
      "bio": null,
      "twitter_username": null,
      "public_repos": 8,
      "followers": 8075,
      "following": 9,
      "created_at": "2011-01-25T18:44:36Z",
  }

  describe "GitHub User" do
    import Devfinder.CoreFixtures

    test "passing valid username to get_user_bio/1 returns the user's GitHub profile" do
      # assert _user = user_fixture(@username)

      HttpMock
      }> expect(:get_user_bio, fn _username ->
        {:ok, @user_bio}
      end)

      result = Devfinder.get_user_bio(@username)

      assert {:ok, _user_bio} == result
    end
  end
end
