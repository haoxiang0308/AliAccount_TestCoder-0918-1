# Exemplo de receita Chef que usa template para gerar arquivo de configuração com nome aleatório

require 'securerandom'

# Gerar um nome aleatório para o arquivo de configuração
config_filename = "/tmp/config_#{SecureRandom.hex(8)}.conf"

# Usar o template para criar o arquivo de configuração
template config_filename do
  source 'app_config.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    database_host: node['myapp']['database_host'] || 'localhost',
    database_port: node['myapp']['database_port'] || 5432,
    app_name: node['myapp']['name'] || 'my_application',
    debug_mode: node['myapp']['debug'] || false,
    environment: node['myapp']['environment'] || 'production'
  )
  action :create
end

# Registrar o nome do arquivo gerado como atributo do nó para uso posterior
ruby_block 'save_config_filename' do
  block do
    node.default['myapp']['config_file'] = config_filename
  end
  action :run
end