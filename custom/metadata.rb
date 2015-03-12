name             "custom"
maintainer       "Carlos Afonso"
maintainer_email "elfonsi@gmail.com"
license          "MIT"
description      "Custom"

%w{ ubuntu debian centos redhat fedora }.each do |os|
	supports os
end
