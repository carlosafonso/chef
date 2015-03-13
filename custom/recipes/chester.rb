Chef::Log.info("Test Chef recipe!!")
Chef::Log.info("#{node[:deploy]['opsworks'][:scm][:ssh_key]}")

#include_recipe "composer"

bash 'ssh_key_and_composer' do
        user 'root'
        cwd "#{node[:deploy]['opsworks'][:deploy_to]}/current"
        code <<-EOH
        echo '#{node[:deploy]['opsworks'][:scm][:ssh_key]}' > ~/.ssh/deploykey
        chmod 400 ~/.ssh/deploykey
        pkill ssh-agent
        eval `ssh-agent -s`
        ssh-add ~/.ssh/deploykey
        composer update
        php artisan migrate
        EOH
end
