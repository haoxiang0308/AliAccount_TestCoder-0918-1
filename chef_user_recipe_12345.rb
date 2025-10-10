user 'chef_test_user' do
  comment 'A user created by Chef'
  uid 1234
  home '/home/chef_test_user'
  shell '/bin/bash'
  password '$6$random_salt$hash'
  action [:create, :manage]
end