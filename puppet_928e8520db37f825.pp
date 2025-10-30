# Puppet manifest to install Apache web server
class apache_install {
  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
  }

  # Ensure the default site is enabled
  exec { 'enable_default_site':
    command     => '/usr/sbin/a2ensite 000-default',
    onlyif      => '/bin/sh -c "test ! -L /etc/apache2/sites-enabled/000-default"',
    require     => Package['apache2'],
    notify      => Service['apache2'],
    provider    => shell,
  }
}

# Include the class
include apache_install