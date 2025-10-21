# Chef recipe to create a user

user 'newuser' do
  comment 'New User Account'
  uid 1234
  gid 'users'
  home '/home/newuser'
  shell '/bin/bash'
  password '$1$somehash'  # This should be a properly encrypted password in real usage
  action [:create, :manage]
end

# Ensure the user's home directory exists
directory '/home/newuser' do
  owner 'newuser'
  group 'users'
  mode '0755'
  action :create
  recursive true
end