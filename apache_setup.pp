# Puppet manifest to install Apache web server

class apache_install {
  # Define the package name for Apache
  $package_name = $facts['os']['family'] ? {
    'RedHat' => 'httpd',
    'Debian' => 'apache2',
    default  => 'apache2',
  }

  # Install the Apache package
  package { $package_name:
    ensure => installed,
  }

  # Ensure the Apache service is running and enabled
  service { $package_name:
    ensure  => running,
    enable  => true,
    require => Package[$package_name],
  }
}

# Apply the class
include apache_install