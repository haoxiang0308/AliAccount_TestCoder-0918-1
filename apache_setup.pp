# Puppet manifest to install and manage the Apache web server.

class apache {
  # Package resource to ensure the 'httpd' package is installed.
  # The 'ensure' parameter is set to 'installed' to manage the package's presence.
  package { 'httpd':
    ensure => installed,
  }

  # Service resource to ensure the 'httpd' service is running and enabled to start at boot.
  # The 'enable' parameter ensures the service is enabled for future boots.
  # The 'ensure' parameter ensures the service is currently running.
  # This service depends on the 'httpd' package being installed.
  service { 'httpd':
    enable => true,
    ensure => running,
    require => Package['httpd'],
  }
}

# Include the apache class to apply the configuration.
include apache