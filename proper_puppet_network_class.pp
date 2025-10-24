# Puppet class for network configuration
class network_config (
  String $interface = 'eth0',
  String $ip_address = '192.168.1.10',
  String $netmask = '255.255.255.0',
  String $gateway = '192.168.1.1',
  Array[String] $dns_servers = ['8.8.8.8', '8.8.4.4'],
  String $ensure_interface = 'present'
) {
  # Configure network interface
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => $ensure_interface,
    content => template('network_config/interface.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['puppet-agent'],
    notify  => Exec['restart_network'],
  }

  # Configure DNS settings
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('network_config/resolv.conf.epp',
      { 'dns_servers' => $dns_servers }
    ),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Restart network service after changes
  exec { 'restart_network':
    command     => "/sbin/ifdown ${interface} && /sbin/ifup ${interface}",
    refreshonly => true,
  }

  # Manage hostname
  file { '/etc/hostname':
    ensure  => file,
    content => "${facts['hostname']}\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Manage hosts file
  file { '/etc/hosts':
    ensure  => file,
    source  => 'puppet:///modules/network_config/hosts',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}

# Alternative implementation using standard resources
class network_config_alt {
  # Configure eth0 interface directly
  file { '/etc/network/interfaces.d/eth0':
    ensure  => file,
    content => "auto eth0\niface eth0 inet static\naddress 192.168.1.10\nnetmask 255.255.255.0\ngateway 192.168.1.1\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
  
  # Restart networking
  exec { 'restart_networking':
    command     => '/etc/init.d/networking restart',
    refreshonly => true,
  }
  
  # Ensure networking service is running
  service { 'networking':
    ensure  => running,
    enable  => true,
    require => File['/etc/network/interfaces.d/eth0'],
    subscribe => [File['/etc/network/interfaces.d/eth0']],
  }
}