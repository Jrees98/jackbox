defmodule LiveGames.Repo do
  use Ecto.Repo,
    otp_app: :live_games,
    adapter: Ecto.Adapters.Postgres
end
