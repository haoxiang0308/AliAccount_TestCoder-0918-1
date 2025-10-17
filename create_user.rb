# Recipe to create a user

user 'newuser' do
  comment 'A new user account'
  uid 1234
  gid 'users'
  home '/home/newuser'
  shell '/bin/bash'
  password '$1$somehash'  # This should be a proper encrypted password
  action :create
end