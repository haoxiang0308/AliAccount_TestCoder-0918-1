#
# Cookbook Name:: example_cookbook
# Recipe:: default
#
# Copyright (c) 2023, Your Company
#

# Установка пакета nginx
package 'nginx' do
  action :install
end

# Запуск службы nginx
service 'nginx' do
  action [:enable, :start]
end