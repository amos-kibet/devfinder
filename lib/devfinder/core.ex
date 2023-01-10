defmodule Devfinder.Core do
  @moduledoc """
  The Core context.
  """
  alias Devfinder.Http

  defdelegate get_user_bio(username), to: Http, as: :get_user_bio
end
