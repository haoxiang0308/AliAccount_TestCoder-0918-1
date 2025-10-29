# Puppet class for network configuration
class puppet_network_config {
  
  # Define network interface parameters
  $network_interfaces = {
    'eth0' => {
      'ipaddress' => $ipaddress_eth0,
      'netmask'   => $netmask_eth0,
      'gateway'   => $gateway,
    }
  }

  # Configure network interfaces
  define network_interface(
    String $ipaddress,
    String $netmask,
    Optional[String] $gateway = undef
  ) {
    # Create network interface configuration file
    file { "/etc/network/interfaces.d/${name}":
      ensure  => file,
      content => template('puppet_network_config/interface.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => Package['puppet'],
      notify  => Exec['restart_network'],
    }
  }

  # Install required packages
  package { 'net-tools':
    ensure => installed,
  }

  # Set hostname if provided
  if $facts['hostname'] != $hostname {
    file { '/etc/hostname':
      ensure  => file,
      content => "${hostname}\n",
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
  }

  # Configure DNS settings
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('puppet_network_config/resolv.conf.epp'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Restart network service after changes
  exec { 'restart_network':
    command     => '/etc/init.d/networking restart',
    refreshonly => true,
  }

  # Example usage of the defined type
  create_resources(network_interface, $network_interfaces)
}

# Class to configure firewall settings
class puppet_network_config::firewall {
  # Install iptables
  package { 'iptables':
    ensure => installed,
  }

  # Basic firewall rules
  file { '/etc/iptables/rules.v4':
    ensure  => file,
    content => template('puppet_network_config/iptables_rules.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
  }
}