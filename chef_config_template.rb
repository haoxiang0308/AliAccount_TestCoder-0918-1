# Template Chef para gerar arquivo de configuração com nome aleatório
require 'securerandom'

# Gerar nome aleatório para o arquivo de configuração
config_filename = "/tmp/config_#{SecureRandom.hex(8)}.conf"

# Criar template de arquivo de configuração
template config_filename do
  source 'app_config.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    database_host: 'localhost',
    database_port: 5432,
    app_name: 'my_application',
    debug_mode: true
  )
end

# O arquivo ERB correspondente (app_config.erb) seria algo como:
# 
# # Configuração gerada para <%= @app_name %>
# [database]
# host = <%= @database_host %>
# port = <%= @database_port %>
# 
# [application]
# name = <%= @app_name %>
# debug = <%= @debug_mode %>