# == Class:: lemon::service
# Controls the lemon-agent service.
#
# === Authors
#
# Steve Traylen <steve.traylen@cern.ch>
#
# === Copyright
#
# Copyright 2012 CERN
#
class lemon::service {
  service { "lemon-agent":
             ensure => running,
             hasstatus => true,
             hasrestart => true,
             enable => true,
             require => Class["lemon::install"];
  }
}
