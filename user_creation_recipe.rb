# Chef recipe to create a user

# Define a user resource to create a new user account
user 'demo_user' do
  comment 'Demo User Account'
  uid 12345
  gid 'users'
  home '/home/demo_user'
  shell '/bin/bash'
  password '$1$hashed_password$example'  # This should be a properly hashed password in real use
  action [:create, :manage]
end

# Create the user's home directory
directory '/home/demo_user' do
  owner 'demo_user'
  group 'users'
  mode '0755'
  action :create
  recursive true
end

# Ensure the user's group exists if needed
group 'demo_user' do
  gid 12345
  members ['demo_user']
  action :create
end