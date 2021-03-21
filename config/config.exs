# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :contaichallenge,
  ecto_repos: [Contaichallenge.Repo]

# Configures the endpoint
config :contaichallenge, ContaichallengeWeb.Endpoint,
  url: [host: "localhost"], #put dns to work with heroku
  secret_key_base: "fKeS1UHRU8jShRpHiIpEx+uAQQGp6KyhtK8cKB0zlz+OEOJt+G4MPwXOBOETWJnm",
  render_errors: [view: ContaichallengeWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Contaichallenge.PubSub,
  live_view: [signing_salt: "ieh2uL1T"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :contaichallenge, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      router: ContaichallengeWeb.Router,     # phoenix routes will be converted to swagger paths
      endpoint: ContaichallengeWeb.Endpoint  # (optional) endpoint config used to set host, port and https schemes.
    ]
  }

config :phoenix_swagger, json_library: Jason

config :contaichallenge, Contaichallenge.Repo,
  migration_primary_key: [type: :binary_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
