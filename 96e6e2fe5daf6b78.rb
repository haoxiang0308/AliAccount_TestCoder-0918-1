# Chef recipe to install a package

# Install the 'curl' package
package 'curl' do
  action :install
end

# Example of installing different packages based on platform
case node['platform_family']
when 'debian'
  package 'git' do
    action :install
  end
when 'rhel', 'fedora'
  package 'git' do
    action :install
  end
end

# You can also install multiple packages
%w[wget vim nano].each do |pkg|
  package pkg do
    action :install
  end
end