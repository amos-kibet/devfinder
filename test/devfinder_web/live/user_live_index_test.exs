defmodule DevfinderWeb.UserLiveIndexTest do
  use DevfinderWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

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
    test "rendered live view has a search form", %{
      conn: conn
    } do
      {:ok, view, _html} = live(conn, "/")

      assert element(view, "#search-form")
    end
  end
end
