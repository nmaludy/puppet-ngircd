class ngircd::params {
  # install
  $package_manage       = true
  $package_name         = 'ngircd'
  $package_ensure       = 'present'

  # config
  # section -> setting -> value
  # this is an array because we can have >1 Operator and Channel sections
  $config               = [
    {
      'Global'   => {
        'Name'   => $facts['fqdn'],
        'Listen' => '0.0.0.0',
      },
    },
  ]
  $config_path          = '/etc/ngircd.conf'
  $config_owner         = 'ngircd'
  $config_group         = 'ngircd'
  $config_mode          = '0660'
  $config_template      = 'ngircd/etc/ngircd.conf.epp'
  $config_augeas_manage = true
  $config_augeas_files  = [
    '/opt/puppetlabs/puppet/share/augeas/lenses/dist/ngircd.aug',
    '/usr/share/augeas/lenses/dist/ngircd.aug',
  ]

  # service
  $service_manage       = true
  $service_name         = 'ngircd'
  $service_ensure       = 'running'
  $service_enable       = true

  # firewall
  $firewalld_manage     = true
  $firewalld_service    = 'irc'
  $firewalld_ensure     = 'present'
  $firewalld_zone       = 'public'
}
