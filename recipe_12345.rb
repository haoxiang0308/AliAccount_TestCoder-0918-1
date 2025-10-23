#
# Cookbook:: my_cookbook
# Recipe:: default
#
# Copyright:: 2025, Your Name
#

# Install the curl package
package 'curl' do
  action :install
end

# Example of installing multiple packages
%w[wget git vim].each do |pkg|
  package pkg do
    action :install
  end
end