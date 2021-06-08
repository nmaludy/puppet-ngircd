# Profile to install + configure ngircd
class ngircd::firewall (
  Boolean $firewalld_manage  = $ngircd::firewalld_manage,
  String  $firewalld_service = $ngircd::firewalld_service,
  String  $firewalld_ensure  = $ngircd::firewalld_ensure,
  String  $firewalld_zone    = $ngircd::firewalld_zone,
) inherits ngircd {
  if $firewalld_manage {
    firewalld_service { $firewalld_service:
      ensure => $firewalld_ensure,
      zone   => $firewalld_zone,
    }
  }
}
