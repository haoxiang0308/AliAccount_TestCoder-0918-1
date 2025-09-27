# Puppet manifest to install Apache web server

class apache_setup {
  # Define the package resource for Apache
  package { 'apache2':
    ensure => installed,
  }

  # Define the service resource for Apache
  service { 'apache2':
    ensure    => running,
    enable    => true,
    require   => Package['apache2'], # Ensure package is installed before starting service
    subscribe => Package['apache2'], # Restart service if package is updated
  }

  # Define a basic virtual host file (optional)
  file { '/etc/apache2/sites-available/000-default.conf':
    content => "<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html
    <Directory /var/www/html>
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
",
    require => Package['apache2'],
    notify  => Service['apache2'], # Notify service to restart if file changes
  }
}

# Include the class to apply the configuration
include apache_setup