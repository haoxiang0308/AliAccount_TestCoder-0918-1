# Класс Puppet для настройки сети
class NetworkConfig {
  # Параметры для настройки интерфейса
  parameter String $interface_name
  parameter String $ip_address
  parameter String $netmask
  parameter Optional[String] $gateway = undef

  # Ресурс для управления файлом конфигурации интерфейса
  file { "/etc/network/interfaces.d/${interface_name}":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('network_config.erb'),
  }

  # Управление службой сети
  service { 'networking':
    ensure  => running,
    enable  => true,
    require => File["/etc/network/interfaces.d/${interface_name}"],
    subscribe => File["/etc/network/interfaces.d/${interface_name}"],
  }
}