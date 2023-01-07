defmodule Devfinder.CoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Devfinder.Core` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        avatar_url: "some avatar_url",
        bio: "some bio",
        company: "some company",
        created_at: "some created_at",
        full_name: "some full_name",
        location: "some location",
        profile_stats: %{},
        twitter_username: "some twitter_username",
        username: "some username",
        work_url: "some work_url"
      })
      |> Devfinder.Core.create_user()

    user
  end
end
