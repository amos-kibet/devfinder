defmodule Devfinder.Core do
  @moduledoc """
  The Core context.
  """
  use GenServer

  alias Devfinder.Http

  @doc """
  Client function that fetches dev profile from GenServer state
  """
  def retrieve_user_bio(username) do
    ensure_started(%{username: username})

    GenServer.call(__MODULE__, :retrieve_user_bio)
  end

  def ensure_started(username) do
    case start(username) do
      {:ok, pid} -> {:ok, pid}
      _ -> start(username)
    end
  end

  def start(%{} = username),
    do: GenServer.start_link(__MODULE__, username, name: __MODULE__)

  def init(init_args) do
    IO.inspect(init_args, label: "[GEN_SERVER INIT]")
    {:ok, init_args, {:continue, :find_dev}}
  end

  def handle_continue(:find_dev, state) do
    IO.inspect(state, label: "[HANDLE_CONTINUE INITIAL STATE")

    if Map.has_key?(state, :user_bio) do
      {:noreply, state}
      |> IO.inspect(label: "HANDLE_CONTINUE IF BLOCK]")
    else
      user_bio = process_user_bio(state.username)

      new_state = Map.put(state, :user_bio, user_bio)

      {:noreply, new_state}
      |> IO.inspect(label: "HANDLE_CONTINUE ELSE BLOCK]")
    end

    user_bio = process_user_bio(state.username)

    new_state = Map.put(state, :user_bio, user_bio)

    {:noreply, new_state}
    |> IO.inspect(label: "HANDLE_CONTINUE FINAL STATE]")
  end

  def handle_call(:retrieve_user_bio, _from, state) do
    IO.inspect(state, label: "[HANDLE_CAST STATE]")
    {:reply, state.user_bio, state}
  end

  def process_user_bio(username) do
    case get_user_bio(username) do
      {:ok, user_bio} ->
        IO.inspect(user_bio, label: "[PROCESS_USER_BIO]")
        user_bio

      _ ->
        process_user_bio(username)
    end
  end

  defdelegate get_user_bio(username), to: Http, as: :get_user_bio
end
