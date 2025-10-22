#
# Cookbook Name:: random_cookbook
# Recipe:: default
#
# Copyright (c) 2025 The Authors, All Rights Reserved.
#

# Example recipe to install a package
package 'curl' do
  action :install
end

# You can replace 'curl' with any package you want to install
# The :install action will ensure the package is installed on the system