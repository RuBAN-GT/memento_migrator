# This file is responsible for configuring your application
use Mix.Config

config :mnesia, dir: '.mnesia/#{Mix.env}/#{node()}'
