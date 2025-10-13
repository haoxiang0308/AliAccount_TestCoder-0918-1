#
# Cookbook:: my_cookbook
# Recipe:: create_user
#
# Copyright:: 2025, Your Name
#

# This recipe creates a user named 'new_user'

user 'new_user' do
  comment 'A new user account created by Chef'
  home '/home/new_user'
  shell '/bin/bash'
  password '$1$hashed_password$example_hash' # Use a real hashed password
  manage_home true
  action :create
end