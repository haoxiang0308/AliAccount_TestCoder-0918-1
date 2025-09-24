# Класс Puppet для настройки сети
class network_config {
  # Параметры класса
  #
  # Examples:
  #
  #   class { 'network_config':
  #     interface => 'eth0',
  #     ip_address => '192.168.1.10',
  #     netmask    => '255.255.255.0',
  #     gateway    => '192.168.1.1',
  #   }

  # Интерфейс для настройки
  $interface = $title,
  # IP-адрес
  $ip_address = undef,
  # Маска подсети
  $netmask = '255.255.255.0',
  # Шлюз по умолчанию
  $gateway = undef,
  # DNS-серверы
  $dns_servers = [],
  # Файл конфигурации интерфейса (зависит от ОС)
  $config_file = $facts['os']['family'] ? {
    'RedHat' => "/etc/sysconfig/network-scripts/ifcfg-${interface}",
    'Debian' => "/etc/network/interfaces.d/${interface}",
    default  => "/etc/network/interfaces.d/${interface}",
  }

  # Ресурс для управления файлом конфигурации интерфейса
  file { $config_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('network_config/ifcfg.erb'),
  }

  # Если задан шлюз, создаем отдельный файл маршрутов (для RedHat)
  if $facts['os']['family'] == 'RedHat' and $gateway {
    file { "/etc/sysconfig/network-scripts/route-${interface}":
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => "default ${gateway} dev ${interface}\n",
    }
  }

  # Управление сервисом сети
  service { 'network':
    ensure => running,
    enable => true,
    require => [
      File[$config_file],
      # Убедимся, что файл маршрута также создан, если он есть
      File["/etc/sysconfig/network-scripts/route-${interface}"],
    ],
    # Перезапустить сервис при изменении конфигурации
    subscribe => [
      File[$config_file],
      File["/etc/sysconfig/network-scripts/route-${interface}"],
    ],
  }
}