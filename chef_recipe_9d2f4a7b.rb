# Chef Recipe to Install a Package
#
# This recipe demonstrates how to install a package using Chef

# Install the curl package
package 'curl' do
  action :install
end

# Example of installing different packages based on platform
case node['platform_family']
when 'debian'
  package 'wget' do
    action :install
  end
when 'rhel', 'fedora'
  package 'wget' do
    action :install
  end
end

# You can also install a specific version of a package
# package 'nginx' do
#   version '1.14.0'
#   action :install
# end

# Or ensure a package is removed
# package 'unwanted-package' do
#   action :remove
# end