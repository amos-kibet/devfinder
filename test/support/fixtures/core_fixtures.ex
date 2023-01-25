defmodule Devfinder.CoreFixtures do
  @moduledoc false

  @doc """
  Generate a test GitHub user profile.
  """
  def user_fixture do
    %{
      full_name: "Amos Kibet",
      avatar_url: "https://avatars.githubusercontent.com/u/50356453?v=4",
      username: "amos-kibet",
      profile_url: "https://github.com/amos-kibet",
      bio: "Fullstack Elixir developer",
      location: "Nairobi, Kenya",
      twitter_username: "@amos_kibet",
      company: "Amozone",
      blog: "https://www.amozone.blog",
      created_at: "7 May 2019",
      profile_stats: %{
        public_repos: "107",
        followers: "32",
        following: "156"
      }
    }
  end
end
