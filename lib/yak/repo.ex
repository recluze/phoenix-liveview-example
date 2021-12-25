defmodule Yak.Repo do
  use Ecto.Repo,
    otp_app: :yak,
    adapter: Ecto.Adapters.Postgres
end
