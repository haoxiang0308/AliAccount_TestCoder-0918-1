# Chef recipe to create a user

user 'newuser' do
  comment 'A new user account'
  uid 1001
  gid 'users'
  home '/home/newuser'
  shell '/bin/bash'
  password '$1$somehashedpassword$hashvalue'  # This should be a proper hash in real usage
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