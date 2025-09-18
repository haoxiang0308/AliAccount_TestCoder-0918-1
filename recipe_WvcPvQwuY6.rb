#
# Cookbook Name:: example_cookbook
# Recipe:: default
#
# Copyright (c) 2023 The Authors, All Rights Reserved.

# Установка пакета nginx
package 'nginx' do
  action :install
end

# Запуск сервиса nginx
service 'nginx' do
  action [:enable, :start]
end