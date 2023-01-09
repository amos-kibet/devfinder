defmodule Devfinder.CoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Devfinder.Core` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(username) do
    {:ok, user} = Devfinder.Core.get_user(username)
    user
  end
end
