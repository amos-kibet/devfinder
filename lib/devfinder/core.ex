defmodule Devfinder.Core do
  @moduledoc """
  The Core context.
  """
  alias Devfinder.Http

  def get_user(username) do
    Http.get_user_data(username)
  end
end
