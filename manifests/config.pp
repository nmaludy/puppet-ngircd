# Profile to install + configure ngircd
class ngircd::config (
  Array[Hash] $config         = $ngircd::config,
  String $path                = $ngircd::config_path,
  String $owner               = $ngircd::config_owner,
  String $group               = $ngircd::config_group,
  String $mode                = $ngircd::config_mode,
  String $template            = $ngircd::config_template,
  Boolean $augeas_manage      = $ngircd::config_augeas_manage,
  Array[String] $augeas_files = $ngircd::config_augeas_files,
) inherits ngircd{
  if $augeas_manage {
    file { $augeas_files:
      ensure    => file,
      owner     => 'root',
      group     => 'root',
      mode      => '0644',
      show_diff => true,
      source    => 'puppet:///modules/ngircd/augeas/ngircd.aug',
    }
  }

  # config
  # Old way
  # $config.each |$section, $section_settings| {
  #   $section_settings.each |$setting, $value| {
  #     # using OOB ini_setting wouldn't work because this file uses ';' for comments
  #     # in some areas... we had to write our own custom augeas lens to handle it
  #     augeas { "${config_path}:${section}:${setting}":
  #       incl      => $config_path,
  #       lens      => 'Ngircd.lns',
  #       context   => "/files/${config_path}",
  #       changes   => ["set ${section}/${setting} ${value}"],
  #       require   => File[$augeas_files],
  #       subscribe => Class['ngircd::install'],
  #       notify    => Class['ngircd::service'],
  #     }
  #   }
  # }

  file { $path:
    ensure    => file,
    owner     => $owner,
    group     => $group,
    mode      => $mode,
    # don't show_diff because there might be passwords in the config
    show_diff => false,
    content   => epp('ngircd/etc/ngircd.conf.epp', config => $config),
  }
}
