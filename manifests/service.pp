#License: GNU Public License v3, see COPYING.txt.

class lemon::service {
  service { "lemon-agent":
             ensure => running,
             hasstatus => true,
             hasrestart => true,
             enable => true,
             require => Class["lemon::install"];
  }
}
