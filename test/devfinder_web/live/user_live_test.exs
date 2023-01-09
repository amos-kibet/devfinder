defmodule DevfinderWeb.UserLiveTest do
  use DevfinderWeb.ConnCase

  # import Phoenix.LiveViewTest
  import Devfinder.CoreFixtures

  @username "octocat"

  defp create_user(_) do
    user = user_fixture(@username)
    %{user: user}
  end

  describe "Search" do
    setup [:create_user]

    test "searches a user on GitHub with the provided username", %{conn: _conn} do
      # TODO: write tests
    end
  end
end
