Mox.defmock(Devfinder.ApiClientMock, for: Devfinder.ApiClientBehaviour)
Mox.defmock(Devfinder.HttpClientMock, for: Devfinder.HttpClientBehaviour)

Application.ensure_all_started(:mox)
Application.ensure_all_started(:ex_machina)

Ecto.Adapters.SQL.Sandbox.mode(Devfinder.Repo, :manual)

ExUnit.start()
