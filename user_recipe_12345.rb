# Chef recipe to create a user
# This recipe creates a user named 'testuser'

user 'testuser' do
  comment 'Test User'
  uid 1001
  gid 1001
  home '/home/testuser'
  shell '/bin/bash'
  password '$1$xyz$wtf0UlhxzzgUdH0sP7VX7.' # This is just an example, normally you'd use a proper encrypted password
  action :create
end

# Create the user's home directory
directory '/home/testuser' do
  owner 'testuser'
  group 'testuser'
  mode '0755'
  action :create
end