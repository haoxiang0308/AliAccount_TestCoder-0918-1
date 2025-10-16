# Chef recipe to create a user

user 'newuser' do
  comment 'A new user account'
  uid 1234
  gid 'users'
  home '/home/newuser'
  shell '/bin/bash'
  password '$1$somehashedpassword'  # This should be a properly hashed password
  action :create
end

# Ensure the user's home directory is created
directory '/home/newuser' do
  owner 'newuser'
  group 'users'
  mode '0755'
  action :create
  not_if { ::File.exist?('/home/newuser') }
end