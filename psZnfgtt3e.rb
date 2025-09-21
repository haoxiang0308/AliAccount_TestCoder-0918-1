# Chef recipe to create a user
# File name: psZnfgtt3e.rb

# Create a system user
user 'myuser' do
  comment 'My Custom User'
  uid 1001
  gid 1001
  home '/home/myuser'
  shell '/bin/bash'
  password '$1$xyz$wB45A9sZvT2Bq89vJ3x4z1' # This is just an example, use a proper encrypted password
  action :create
end

# Create the user's home directory
directory '/home/myuser' do
  owner 'myuser'
  group 'myuser'
  mode '0755'
  action :create
end