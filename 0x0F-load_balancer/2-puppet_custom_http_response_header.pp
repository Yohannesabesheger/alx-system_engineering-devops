# 2-puppet_custom_http_response_header.pp

package { 'nginx':
  ensure => installed,
}

file { '/etc/nginx/snippets/custom_header.conf':
  ensure  => file,
  content => "add_header X-Served-By \"$::hostname\";",
  require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
  ensure  => file,
  require => File['/etc/nginx/snippets/custom_header.conf'],
  notify  => Service['nginx'],
  # Insert custom_header.conf after 'server_name _;'
  content => template('custom_header/default.erb'),
}

file { '/etc/nginx/sites-enabled/default':
  ensure => link,
  target => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  require    => Package['nginx'],
}
