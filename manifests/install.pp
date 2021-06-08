# Profile to install + configure ngircd
class ngircd::install (
  Boolean $package_manage = $ngircd::package_manage,
  String $package_name    = $ngircd::package_name,
  String $package_ensure  = $ngircd::package_ensure,
) inherits ngircd {
  # install
  if $package_manage {
    package { $package_name:
      ensure  => $package_ensure,
      require => Class['epel'],
      notify  => Class['ngircd::service'],
    }
  }
}
