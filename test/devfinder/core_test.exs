defmodule Devfinder.CoreTest do
  use Devfinder.DataCase

  alias Devfinder.Core

  @username "octocat"

  describe "users" do
    alias Devfinder.Http.User

    # import Devfinder.CoreFixtures

    test "get_user/1 with valid data returns a user's GitHub profile" do
      assert {:ok, %User{} = _user} = Core.get_user(@username)
    end
  end
end
