# 7-puppet_install_nginx_web_server.pp
# Puppet manifest to install nginx, serve "Hello World!" at /, and redirect /redirect_me with 301

# Ensure nginx is installed
package { 'nginx':
  ensure => installed,
}

# Ensure nginx service is running and enabled
service { 'nginx':
  ensure     => running,
  enable     => true,
  require    => Package['nginx'],
}

# Create the custom index.html page with "Hello World!"
file { '/var/www/html/index.html':
  ensure  => file,
  content => "Hello World!\n",
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0644',
  require => Package['nginx'],
}

# Configure redirection inside nginx default site config
file_line { 'redirect_me location block':
  path  => '/etc/nginx/sites-available/default',
  line  => "\tlocation /redirect_me {\n\t\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\n\t}",
  match => '^.*location /redirect_me.*$',
  notify => Service['nginx'],
}

# Ensure the Nginx config file contains a root server block (if not already)
file_line { 'ensure server root present':
  path  => '/etc/nginx/sites-available/default',
  line  => "\troot /var/www/html;",
  match => '^\s*root\s+.*;',
  notify => Service['nginx'],
}

# Restart nginx if config is changed
exec { 'reload-nginx':
  command     => '/usr/sbin/nginx -s reload',
  refreshonly => true,
  subscribe   => File_line['redirect_me location block'],
}
