defmodule Devfinder.Factory do
  use ExMachina.Ecto, repo: Devfinder.Repo

  def user_bio_factory do
    %Devfinder.ApiClient.User{
      full_name: sequence("kibet"),
      username: sequence("kibet"),
      avatar_url: "https://avatars.githubusercontent.com/u/50356453?v=4",
      profile_url: "https://avatars.githubusercontent.com/u/50356453?v=4",
      bio: sequence("bio"),
      created_at: "7 May 2019",
      profile_stats: %{public_repos: "100", followers: "100", following: "100"},
      location: "Nairobi, Kenya",
      twitter_username: "@kibet",
      company: "Amozone Lab",
      blog: "https://www.amozone.blog"
    }
  end
end
