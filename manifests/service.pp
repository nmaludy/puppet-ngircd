# Profile to install + configure ngircd
class ngircd::service (
  Boolean $service_manage = $ngircd::service_manage,
  String  $service_name   = $ngircd::service_name,
  String  $service_ensure = $ngircd::service_ensure,
  Boolean $service_enable = $ngircd::service_enable,
) inherits ngircd {
  if $service_manage {
    service { $service_name:
      ensure => $service_ensure,
      enable => $service_enable,
    }
  }
}
