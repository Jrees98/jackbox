defmodule LiveGames.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LiveGames.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveGames.PubSub},
      # Start Finch
      {Finch, name: LiveGames.Finch}
      # Start a worker by calling: LiveGames.Worker.start_link(arg)
      # {LiveGames.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: LiveGames.Supervisor)
  end
end
