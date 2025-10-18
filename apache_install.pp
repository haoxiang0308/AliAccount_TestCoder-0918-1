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

  # Basic configuration file
  file { '/etc/apache2/sites-available/default-site.conf':
    ensure  => file,
    content => template('apache/default-site.conf.erb'),
    require => Package['apache2'],
    notify  => Service['apache2'],
  }

  # Enable the site
  exec { 'enable_default_site':
    command => '/usr/sbin/a2ensite default-site.conf',
    onlyif  => '/bin/ls /etc/apache2/sites-available/default-site.conf',
    require => File['/etc/apache2/sites-available/default-site.conf'],
    notify  => Service['apache2'],
  }
}

# Apply the class
include apache_install