defmodule Devfinder.Core do
  @moduledoc false
  def api_client, do: Application.get_env(:devfinder, :api_client)

  def get_user_bio(username) do
    api_client().get_user_bio(username)
  end
end
