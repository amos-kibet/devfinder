defmodule Devfinder.HttpClientTest do
  use ExUnit.Case
  use Devfinder.DataCase

  import Mox
  import Devfinder.Factory

  @username "octocat"

  def http_client, do: Application.get_env(:devfinder, :http_client)

  def find_dev(username) do
    IO.puts("[TEST HTTP_CLIENT CALLED]")
    http_client().find_dev(username)
  end

  describe "GitHub User Search" do
    test "passing valid username to find_dev/1 returns the user's GitHub profile" do
      user_bio = build(:user_bio)

      Devfinder.HttpClientMock
      |> expect(:find_dev, fn _username ->
        {:ok, user_bio}
      end)

      result = find_dev(@username)

      assert {:ok, user_bio} == result
    end
  end
end
