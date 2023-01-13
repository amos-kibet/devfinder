defmodule DevfinderWeb.UserLiveTest do
  use DevfinderWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Devfinder.CoreFixtures

  describe "Connected & Disconnected State" do
    test "pre-connected", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "Repos"
    end

    test "connected mount", %{conn: conn} do
      {:ok, view, html} = live(conn, "/")

      assert html =~ "Repos"
      assert render(view) =~ "Repos"
    end
  end
end
