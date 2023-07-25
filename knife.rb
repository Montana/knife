knife[:chef_repo_path] = "#{ENV['HOME']}/.chef"

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                ENV['USER']
client_key               "#{knife[:chef_repo_path]}/#{ENV['USER']}.pem"
validation_client_name   "chef-validator"
validation_key           "#{knife[:chef_repo_path]}/chef-validator.pem"
chef_server_url          "https://chef.example.com/organizations/#{ENV['ORGNAME']}"
cache_type               'BasicFile'
cache_options( :path => "#{knife[:chef_repo_path]}/checksums" )
cookbook_path            ["~/example.com/cookbooks"]

# path to environment files
environment_path "#{knife[:chef_repo_path]}/environments"

# Path to encrypted data bag and secret file
knife[:secret_file]       = "/etc/chef/encrypted_data_bag_secret"

knife[:aws_access_key_id] = ENV['AWS_ACCESS_KEY_ID']
knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY']
