# == Class: artifactory::service
#
# This class manages the artifactory service.  It should not be called directly
#
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class artifactory::service {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  service { 'artifactory':
    ensure   => running,
    name     => $::artifactory::service_name,
    enable   => true,
    require  => [ Class['java'], File[$::artifactory::data_path], File[$::artifactory::home_dir] ],
  }

}
