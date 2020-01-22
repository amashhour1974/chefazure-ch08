require 'chef/provisioning/azurerm'
with_driver 'AzureRM:d4f05b04-156f-47a6-bb1a-534a0b013601'

azure_resource_group 'chefazure-ch08-ci' do
  location 'West Europe'
end

azure_resource_template 'jenkins-server' do
  resource_group 'chefazure-ch08-ci'
  template_source "#{Chef::Config[:cookbook_path]}/chefazure-ch08/files/shared/machine_deploy.json"
  parameters location: 'West Europe',
             vmSize: 'Basic_A1',
             newStorageAccountName: 'chazch8ci',
             adminUsername: 'azure',
             adminPassword: 'P2ssw0rd',
             dnsNameForPublicIP: 'chefazure-ch08-ci',
             imagePublisher: 'Canonical',
             imageOffer: 'UbuntuServer',
             imageSKU: '14.04.3-LTS',
             vmName: 'chazch08jenkins'
  chef_extension client_type: 'LinuxChefClient',
                 version: '1210.12',
                 runlist: 'role[jenkins]',
                 environment: '_default'
end
