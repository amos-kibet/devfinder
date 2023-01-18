defmodule Devfinder.ApiClientTest do
  alias Devfinder.ApiClient

  use ExUnit.Case

  @username "octocat"

  test "returns dev profile when the username exists in GitHub" do
    result = {:ok, _user_bio}

    assert result == ApiClient.get_user_bio(@username)
  end
end
