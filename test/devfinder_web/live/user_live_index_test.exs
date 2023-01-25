defmodule DevfinderWeb.UserLiveIndexTest do
  use DevfinderWeb.ConnCase, async: true

  import Mox
  import Phoenix.LiveViewTest

  setup :set_mox_from_context
  setup :verify_on_exit!

  def api_client, do: Application.get_env(:devfinder, :api_client)

  def get_user_bio(username) do
    api_client().get_user_bio(username)
  end

  describe "Pre-connected & connected state" do
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

  describe "Search" do
    test "get_dev_bio/1 returns GitHub profile of a user with the provided username", %{
      conn: conn
    } do
      {:ok, view, _html} = live(conn, "/")

      assert view
             |> element("#search-form")
             |> render_submit() =~ "octocat"
    end
  end
end
