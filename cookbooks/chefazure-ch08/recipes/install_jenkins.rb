include_recipe 'jenkins::master'

package 'git' do
  action :install
end

jenkins_plugin 'github' do
  action :install
  notifies :restart, 'service[jenkins]', :delayed
end

jenkins_plugin 'build-pipeline-plugin' do
  action :install
  notifies :restart, 'service[jenkins]', :delayed
end

package 'build-essential' do
  action :install
end

gem_package 'chef-provisioning' do
  action :install
end

gem_package 'chef-provisioning-azurerm' do
  action :install
end

gem_package 'rspec' do
  action :install
end

gem_package 'rake' do
  action :install
end

gem_package 'rubocop' do
  action :install
end
