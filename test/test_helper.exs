ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Devfinder.Repo, :manual)
Mox.defmock(Devfinder.ApiClientMock, for: Devfinder.ApiClientBehaviour)
# Mox.defmock(HttpMock, for: Finch)
