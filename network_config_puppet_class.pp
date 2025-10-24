# Puppet class for network configuration
class network_config {
  # Parameters for network configuration
  $interface = 'eth0',
  $ip_address = '192.168.1.10',
  $netmask = '255.255.255.0',
  $gateway = '192.168.1.1',
  $dns_servers = ['8.8.8.8', '8.8.4.4']

  # Configure network interface
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('network_config/interface.erb'),
    require => Package['network-manager'],
    notify  => Service['networking'],
  }

  # Install required network packages
  package { 'network-manager':
    ensure => installed,
  }

  # Configure DNS settings
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('network_config/resolv.conf.epp'),
    require => Package['network-manager'],
  }

  # Ensure networking service is running
  service { 'networking':
    ensure  => running,
    enable  => true,
    require => [
      Package['network-manager'],
      File["/etc/network/interfaces.d/${interface}"],
    ],
  }

  # Configure hostname if needed
  file { '/etc/hostname':
    ensure  => file,
    content => "${name}\n",
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }
}

# Define resource for configuring a specific network interface
define network_interface(
  String $ipaddress,
  String $netmask = '255.255.255.0',
  Boolean $onboot = true,
  String $bootproto = 'static',
  String $type = 'Ethernet'
) {
  # Create interface configuration file
  file { "/etc/sysconfig/network-scripts/ifcfg-${name}":
    ensure  => file,
    content => template('network_config/ifcfg.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}