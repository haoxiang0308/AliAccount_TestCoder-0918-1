# Puppet manifest to install Apache web server

class apache_install {
  # Install the Apache package
  package { 'httpd':
    ensure => installed,
  }

  # Ensure the Apache service is running and enabled
  service { 'httpd':
    ensure    => running,
    enable    => true,
    require   => Package['httpd'],
    subscribe => Package['httpd'],
  }

  # Create a basic index.html file
  file { '/var/www/html/index.html':
    ensure  => file,
    content => "<html><body><h1>Hello from Puppet-managed Apache!</h1></body></html>",
    require => Package['httpd'],
  }
}

# Apply the class
include apache_install