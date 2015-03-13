Chef::Log.info("Test Chef recipe!!")
Chef::Log.info("#{node[:deploy]['opsworks'][:scm][:ssh_key]}")

include_recipe "composer"

execute "bazinga" do
        cwd "#{node[:deploy]['opsworks'][:deploy_to]}/current"
        command "echo '#{node[:deploy]['opsworks'][:scm][:ssh_key]}' > ~/.ssh/deploykey"
        command "chmod 400 ~/.ssh/deploykey"
        command "eval `ssh-agent -s`"
        command "ssh-add ~/.ssh/deploykey"
        #command "composer update --no-interaction --no-ansi"
end

#composer_package "/srv/www/opsworks/current" do
#       action :install
#end
