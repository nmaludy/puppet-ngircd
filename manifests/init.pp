# Profile to install + configure ngircd
class ngircd (
  Boolean $package_manage    = $ngircd::params::package_manage,
  String  $package_name      = $ngircd::params::package_name,
  String  $package_ensure    = $ngircd::params::package_ensure,
  # section -> setting -> value,
  # this is an array because we can have >1 Operator and Channel sections
  Array[Hash] $config = $ngircd::params::config,
  String $path                = $ngircd::params::config_path,
  String $owner               = $ngircd::params::config_owner,
  String $group               = $ngircd::params::config_group,
  String $mode                = $ngircd::params::config_mode,
  String $template            = $ngircd::params::config_template,
  Boolean $config_augeas_manage = $ngircd::params::config_augeas_manage,
  Array[String] $config_augeas_files = $ngircd::params::config_augeas_files,
  Boolean $service_manage    = $ngircd::params::service_manage,
  String  $service_name      = $ngircd::params::service_name,
  String  $service_ensure    = $ngircd::params::service_ensure,
  Boolean $service_enable    = $ngircd::params::service_enable,
  Boolean $firewalld_manage  = $ngircd::params::firewalld_manage,
  String  $firewalld_service = $ngircd::params::firewalld_service,
  String  $firewalld_ensure  = $ngircd::params::firewalld_ensure,
  String  $firewalld_zone    = $ngircd::params::firewalld_zone,
) inherits ngircd::params {
  contain ngircd::install
  contain ngircd::config
  contain ngircd::firewall
  contain ngircd::service
}
