file { '/home/ubuntu/.ssh':
  ensure => directory,
  mode   => '0700',
  owner  => 'ubuntu',
  group  => 'ubuntu',
}

file { '/home/ubuntu/.ssh/config':
  ensure  => present,
  mode    => '0600',
  owner   => 'ubuntu',
  group   => 'ubuntu',
}

file_line { 'Declare identity file':
  path  => '/home/ubuntu/.ssh/config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^ *IdentityFile',
}

file_line { 'Turn off passwd auth':
  path  => '/home/ubuntu/.ssh/config',
  line  => '    PasswordAuthentication no',
  match => '^ *PasswordAuthentication',
}
