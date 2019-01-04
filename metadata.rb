name 'rkhunter'
maintainer 'gregpalmier'
maintainer_email 'gregpalmier@gmail.com'
license 'Apache-2.0'
description 'Installs/Configures rkhunter'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.5'
chef_version '>= 12.0'

depends 'yum-epel'

supports 'centos'
supports 'debian'
supports 'fedora'
supports 'redhat'
supports 'ubuntu'

source_url 'https://github.com/gregpalmier/rkhunter-cookbook'
issues_url 'https://github.com/gregpalmier/rkhunter-cookbook/issues'
