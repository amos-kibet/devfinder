defmodule Devfinder.CoreTest do
  use Devfinder.DataCase

  alias Devfinder.Core

  describe "users" do
    alias Devfinder.Core.User

    import Devfinder.CoreFixtures

    @invalid_attrs %{
      avatar_url: nil,
      bio: nil,
      company: nil,
      created_at: nil,
      full_name: nil,
      location: nil,
      profile_stats: nil,
      twitter_username: nil,
      username: nil,
      work_url: nil
    }

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Core.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Core.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{
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
      }

      assert {:ok, %User{} = user} = Core.create_user(valid_attrs)
      assert user.avatar_url == "some avatar_url"
      assert user.bio == "some bio"
      assert user.company == "some company"
      assert user.created_at == "some created_at"
      assert user.full_name == "some full_name"
      assert user.location == "some location"
      assert user.profile_stats == %{}
      assert user.twitter_username == "some twitter_username"
      assert user.username == "some username"
      assert user.work_url == "some work_url"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()

      update_attrs = %{
        avatar_url: "some updated avatar_url",
        bio: "some updated bio",
        company: "some updated company",
        created_at: "some updated created_at",
        full_name: "some updated full_name",
        location: "some updated location",
        profile_stats: %{},
        twitter_username: "some updated twitter_username",
        username: "some updated username",
        work_url: "some updated work_url"
      }

      assert {:ok, %User{} = user} = Core.update_user(user, update_attrs)
      assert user.avatar_url == "some updated avatar_url"
      assert user.bio == "some updated bio"
      assert user.company == "some updated company"
      assert user.created_at == "some updated created_at"
      assert user.full_name == "some updated full_name"
      assert user.location == "some updated location"
      assert user.profile_stats == %{}
      assert user.twitter_username == "some updated twitter_username"
      assert user.username == "some updated username"
      assert user.work_url == "some updated work_url"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_user(user, @invalid_attrs)
      assert user == Core.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Core.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Core.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Core.change_user(user)
    end
  end
end
