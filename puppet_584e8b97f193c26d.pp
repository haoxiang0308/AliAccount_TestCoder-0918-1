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

  # Make sure the default site is enabled
  exec { 'enable_default_site':
    command     => '/usr/sbin/a2ensite 000-default',
    onlyif      => '/bin/test -f /etc/apache2/sites-available/000-default.conf && /bin/test ! -L /etc/apache2/sites-enabled/000-default.conf',
    subscribe   => Package['apache2'],
    notify      => Service['apache2'],
    require     => Package['apache2'],
  }
}

# Apply the class
include apache_install