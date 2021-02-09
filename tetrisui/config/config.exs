# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :tetrisui, TetrisuiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MURRDs8/zYQfa2zco0JuQKVH9OD1BXS9/jggKyufS4xqkuQ82izb5+QiSZp0M7Vb",
  render_errors: [view: TetrisuiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Tetrisui.PubSub,
  live_view: [signing_salt: "2IgeeQ7x7dKe0FSeSHlI2FwYdRRWENhG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
