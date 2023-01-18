defmodule Devfinder.ApiClientBehaviour do
  @moduledoc false

  @callback get_user_bio(String.t()) :: tuple()
end
