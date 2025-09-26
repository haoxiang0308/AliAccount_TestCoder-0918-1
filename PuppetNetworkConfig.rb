# Класс Puppet для настройки сети
class NetworkConfig {
  # Параметры для настройки интерфейса
  $interface_name = $title
  $ip_address
  $netmask
  $gateway = undef

  # Ресурс для управления файлом конфигурации интерфейса
  file { "/etc/network/interfaces.d/${interface_name}":
    ensure  => file,
    content => template('network_config/interface.erb'),
    require => Package['linux-base'],
    notify  => Exec['restart_networking'],
  }

  # Опциональный маршрут по умолчанию
  if $gateway {
    file { "/etc/network/interfaces.d/gateway_${interface_name}":
      ensure  => file,
      content => template('network_config/gateway.erb'),
      require => File["/etc/network/interfaces.d/${interface_name}"],
      notify  => Exec['restart_networking'],
    }
  }

  # Команда для перезагрузки службы сети
  exec { 'restart_networking':
    command     => '/sbin/ifdown ${interface_name} && /sbin/ifup ${interface_name}',
    refreshonly => true,
  }
}