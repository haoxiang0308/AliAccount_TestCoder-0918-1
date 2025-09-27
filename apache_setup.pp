# Puppet manifest to install the Apache web server.

class apache {
  # Declare the package resource for Apache.
  # The 'ensure' parameter set to 'installed' means Puppet will install the package if it's not present.
  package { 'apache2':
    ensure => installed,
  }

  # Declare the service resource for Apache.
  # The 'enable' parameter ensures the service starts on boot.
  # The 'ensure' parameter set to 'running' means Puppet will start the service if it's not running.
  # The 'require' parameter ensures the service is only managed after the package is installed.
  service { 'apache2':
    enable => true,
    ensure => running,
    require => Package['apache2'],
  }
}

# Apply the apache class to the current node.
include apache