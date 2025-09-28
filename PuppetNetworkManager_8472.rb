# Класс Puppet для настройки сети
class NetworkManager {
  # Параметры класса
  $interface = 'eth0',
  $ip_address = '192.168.1.10',
  $netmask = '255.255.255.0',
  $gateway = '192.168.1.1',
  $dns_servers = ['8.8.8.8', '8.8.4.4']
} {
  # Управление пакетом NetworkManager
  package { 'NetworkManager':
    ensure => installed,
  }

  # Управление службой NetworkManager
  service { 'NetworkManager':
    ensure => running,
    enable => true,
    require => Package['NetworkManager'],
  }

  # Создание или изменение конфигурационного файла интерфейса
  file { "/etc/sysconfig/network-scripts/ifcfg-${interface}":
    ensure  => file,
    content => "
DEVICE=${interface}
BOOTPROTO=static
ONBOOT=yes
IPADDR=${ip_address}
NETMASK=${netmask}
GATEWAY=${gateway}
DNS1=${dns_servers[0]}
DNS2=${dns_servers[1]}
",
    require => Package['NetworkManager'],
    notify  => Service['NetworkManager'],
  }
}