defmodule Devfinder.ApiClient.User do
  @moduledoc false

  defstruct avatar_url: nil,
            full_name: nil,
            username: nil,
            profile_url: nil,
            bio: nil,
            created_at: nil,
            profile_stats: %{public_repos: nil, followers: nil, following: nil},
            location: nil,
            twitter_username: nil,
            company: nil,
            blog: nil
end
