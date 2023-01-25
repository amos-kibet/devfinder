defmodule Devfinder.HttpClientBehaviour do
  @moduledoc false

  @callback find_dev(String.t()) :: tuple()
end
