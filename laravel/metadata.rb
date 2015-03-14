name             "laravel"
maintainer       "Carlos Afonso Pérez"
maintainer_email "carlos.afonso.perez@gmail.com"
license          "MIT"
description      "Recipe to perform deployment-related actions in Laravel applications"

%w{ ubuntu debian centos redhat fedora }.each do |os|
	supports os
end