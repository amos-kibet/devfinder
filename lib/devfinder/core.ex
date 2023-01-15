defmodule Devfinder.Core do
  @moduledoc """
  The Core context.
  """
  defdelegate get_user_bio(username), to: Devfinder.Http, as: :get_user_bio
end
