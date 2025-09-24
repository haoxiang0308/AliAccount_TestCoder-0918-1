# Recipe to create a user named 'johndoe'

user 'johndoe' do
  comment 'John Doe'
  uid 1234
  gid 'users'
  home '/home/johndoe'
  shell '/bin/bash'
  password '$1$somehash' # This is a placeholder hash
  action [:create, :manage]
end