defmodule LocacaoApi.Repo do
  use Ecto.Repo,
    otp_app: :locacao_api,
    adapter: Ecto.Adapters.MyXQL
end
