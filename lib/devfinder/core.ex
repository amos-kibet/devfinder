defmodule Devfinder.Core do
  @moduledoc """
  The Core context.
  """
  alias Devfinder.Http

  defdelegate get_user(username), to: Http, as: :get_user_data
end
