# Класс Puppet для настройки сети
class network_config {

  # Параметры класса (опционально, можно задавать при вызове)
  # Пример параметров:
  # $ip_address = '192.168.1.10',
  # $netmask = '255.255.255.0',
  # $gateway = '192.168.1.1',
  # $dns_servers = ['8.8.8.8', '8.8.4.4']

  # Ресурс для управления сетевым интерфейсом (пример для Linux)
  # Этот пример использует исполняемый файл /sbin/ifup и /sbin/ifdown и файлы конфигурации в /etc/network/interfaces.d/
  # Путь к файлу конфигурации интерфейса
  $interface_config_file = "/etc/network/interfaces.d/auto_config_interface";

  # Содержимое файла конфигурации интерфейса
  $interface_config_content = "
# Конфигурация интерфейса, созданная Puppet
auto eth0
iface eth0 inet static
    address ${ip_address}
    netmask ${netmask}
    gateway ${gateway}
    dns-nameservers ${join(dns_servers, ' ')}
";

  # Файл конфигурации интерфейса
  file { $interface_config_file:
    ensure  => file,
    content => $interface_config_content,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['augeas'],
    # После изменения файла интерфейса перезапустить сеть (осторожно!)
    # notify => Exec['restart_network'],
  }

  # Опционально: выполнить команду для перезагрузки интерфейса
  # exec { 'restart_network':
  #   command     => '/sbin/ifdown eth0 && /sbin/ifup eth0',
  #   refreshonly => true,
  #   subscribe   => File[$interface_config_file],
  # }

  # Ресурс для управления файлом /etc/resolv.conf (DNS)
  # Альтернативно, можно использовать модуль puppetlabs-dns
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp("
# Managed by Puppet
<% $dns_servers.each |$server| { -%>
nameserver <%= $server %>
<% } -%>
"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}