defmodule Devfinder.ApiClientTest do
  use ExUnit.Case
  use Devfinder.DataCase

  import Mox
  import Devfinder.Factory

  @username "octocat"

  setup :verify_on_exit!

  def api_client, do: Application.get_env(:devfinder, :api_client)

  def get_user_bio(username) do
    IO.puts("[TEST API_CLIENT CALLED]")

    api_client().get_user_bio(username)
  end

  describe "GitHub User Search" do
    test "passing valid username to get_user_bio/1 returns the user's GitHub profile" do
      user_bio = build(:user_bio)

      Devfinder.ApiClientMock
      |> expect(:get_user_bio, fn _username ->
        {:ok, user_bio}
      end)

      result = get_user_bio(@username)

      assert {:ok, user_bio} == result
    end
  end
end
