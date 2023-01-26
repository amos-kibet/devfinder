ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Devfinder.Repo, :manual)

Application.ensure_all_started(:mox)

Mox.defmock(Devfinder.ApiClientMock, for: Devfinder.ApiClientBehaviour)
Mox.defmock(Devfinder.HttpClientMock, for: Devfinder.HttpClientBehaviour)
