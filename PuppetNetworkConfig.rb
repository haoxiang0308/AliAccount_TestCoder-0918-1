# Класс Puppet для настройки сети
class NetworkConfig {
  # Параметры класса
  param String $interface = 'eth0',
  param String $ip_address,
  param String $netmask = '255.255.255.0',
  param String $gateway,
  param Array[String] $dns_servers = ['8.8.8.8', '8.8.4.4']

  # Ресурс для управления файлом интерфейса
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('network_config/network_interface.erb'),
  }

  # Ресурс для управления файлом resolv.conf
  file { '/etc/resolv.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('network_config/resolv_conf.epp'),
  }
}