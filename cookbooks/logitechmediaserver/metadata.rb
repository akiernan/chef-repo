maintainer       "Alex Kiernan"
maintainer_email "alexk@alexandalex.com"
license          "Apache 2.0"
description      "Installs/Configures logitechmediaserver"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
depends          "apt"
%w{ ubuntu debian }.each do |os|
  supports os
end
