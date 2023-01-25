ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Devfinder.Repo, :manual)

Application.ensure_all_started(:mox)

Mox.defmock(Devfinder.ApiClientMock, for: Devfinder.ApiClientBehaviour)
Mox.defmock(Devfinder.HttpClientMock, for: Devfinder.HttpClientBehaviour)

# Application.put_env(:devfinder, :api_client, Devfinder.ApiClientBehaviour)
# Application.put_env(:devfinder, :http_client, Devfinder.HttpClientBehaviour)
