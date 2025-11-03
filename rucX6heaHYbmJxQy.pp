# Defined resource type for managing multiple service instances
define multi_instance_service (
  String $ensure = 'present',
  String $version = 'latest',
  Optional[String] $config_file = undef,
  Optional[Array[String]] $dependencies = [],
) {
  # Create a service instance with the given parameters
  package { "multi-instance-${name}":
    ensure => $version,
  }

  file { "/etc/systemd/system/${name}.service":
    ensure  => $ensure,
    content => template('multi_instance_service/service.erb'),
    require => Package["multi-instance-${name}"],
  }

  service { $name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [
      Package["multi-instance-${name}"],
      File["/etc/systemd/system/${name}.service"],
    ],
  }

  # Handle dependencies if specified
  if $dependencies {
    Service[$name] -> Package[$dependencies]
  }

  # Handle custom config file if specified
  if $config_file {
    file { "/etc/${name}/config.conf":
      ensure  => $ensure,
      source  => $config_file,
      require => Package["multi-instance-${name}"],
    }
  }
}

# Example usage of the defined resource:
# multi_instance_service { 'webapp-prod':
#   version => '2.4.1',
#   config_file => 'puppet:///modules/multi_instance_service/webapp.conf',
#   dependencies => ['nginx', 'postgresql'],
# }
# 
# multi_instance_service { 'webapp-staging':
#   version => '2.4.0',
#   config_file => 'puppet:///modules/multi_instance_service/webapp-staging.conf',
# }