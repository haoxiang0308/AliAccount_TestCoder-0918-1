# Класс Puppet для настройки сети
class network_config {
  # Параметры для настройки интерфейса
  $interface_name = $facts['networking']['primary']
  $ip_address = $facts['networking']['ip']
  $netmask = $facts['networking']['netmask']

  # Ресурс для управления сетевым интерфейсом (пример для Linux)
  # В реальной реализации это может зависеть от дистрибутива
  file { "/etc/network/interfaces.d/${interface_name}":
    ensure  => file,
    content => "# Сгенерировано автоматически\nauto ${interface_name}\niface ${interface_name} inet static\n    address ${ip_address}\n    netmask ${netmask}\n",
    require => Package['linux-base'],
  }

  # Перезапуск службы сети для применения изменений
  service { 'networking':
    enable => true,
    ensure => running,
    require => File["/etc/network/interfaces.d/${interface_name}"],
  }
}