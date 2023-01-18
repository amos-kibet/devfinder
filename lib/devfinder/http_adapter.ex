defmodule Devfinder.HttpAdapter do
  @moduledoc false

  require Logger

  @url "https://api.github.com/users/"

  def find_dev(username) when is_binary(username) do
    url = process_url(username)

    result =
      Finch.build(:get, url)
      |> Finch.request(Http)

    case result do
      {:ok, %Finch.Response{} = response} ->
        if response.status == 200 do
          response
          |> Map.get(:body)
          |> Jason.decode()
        else
          Logger.info("Username not found!")
          {:error, :not_found}
        end

      {:error, _error} ->
        Logger.error("Something went wrong on the server!")
        {:error, :finch_error}
    end
  end

  defp process_url(username) do
    @url <> username
  end
end
