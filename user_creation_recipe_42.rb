# Chef recipe to create a user
# This recipe creates a new user with specified attributes

# Create a user named 'newuser'
user 'newuser' do
  comment 'New User'
  uid 1001
  gid 1001
  home '/home/newuser'
  shell '/bin/bash'
  password '$1$xyz$wtf0UlPgg1rwYJ3aGogZP0' # Example encrypted password
  action :create
end

# Create the user's home directory
directory '/home/newuser' do
  owner 'newuser'
  group 'newuser'
  mode '0755'
  action :create
end