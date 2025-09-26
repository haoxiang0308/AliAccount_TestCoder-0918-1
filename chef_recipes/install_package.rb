# Recipe to install a package using Chef

# Example: Install the 'curl' package
package 'curl' do
  action :install
end

# You can replace 'curl' with any package name you need to install
# For example, to install 'vim', change the line to:
# package 'vim' do
#   action :install
# end