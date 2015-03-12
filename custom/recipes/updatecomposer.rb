include_recipe "composer"

node[:deploy].each do |application, deploy|
	composer_composer_package "#{deploy[:deploy_to]}" do
		Chef::Log.debug("Will do composer update on #{deploy[:deploy_to]}")
		action [:update]
	end
end