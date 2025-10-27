# Chef recipe to install a package
#
# This recipe installs a package using the package resource

package 'curl' do
  action :install
end