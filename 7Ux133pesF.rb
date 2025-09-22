# Chef recipe to create a user
# Generated randomly as 7Ux133pesF.rb

# Create a system user with specific attributes
user 'myuser' do
  comment 'My Custom User'
  uid 1001
  gid 1001
  home '/home/myuser'
  shell '/bin/bash'
  password '$1$abc123$H87h3jKl4mN9pQrS7tUvW/' # Example encrypted password
  action :create
end

# Create the user's home directory
directory '/home/myuser' do
  owner 'myuser'
  group 'myuser'
  mode '0755'
  action :create
end