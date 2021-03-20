defmodule Contaichallenge.Repo do
  use Ecto.Repo,
    otp_app: :contaichallenge,
    adapter: Ecto.Adapters.Postgres
end
