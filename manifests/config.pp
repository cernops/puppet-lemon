#License: GNU Public License v3, see COPYING.txt.

class lemon::config (
   $lemonservers = $lemon::params::lemonservers
 ) inherits lemon::params {
  class {'lemon::metrics':}

  file {'/etc/lemon/agent/general.conf':
         ensure => present ,
         content => template("lemon/general.conf.erb"),
         owner   => "root",
         group   => "root",
         require => Class["lemon::install"],
         notify  => Class["lemon::service"],
  }
  
  file {'/etc/lemon/agent/transport/udp.conf':
         ensure => present ,
         content => template("lemon/udp.conf.erb"),
         owner   => "root",
         group   => "root",
         require => Class["lemon::install"],
         notify  => Class["lemon::service"],
  }
 
  file {'/etc/lemon/agent/metrics/':
        ensure => directory,
        owner  => root,
        group  => root,
        purge  => true,
        recurse => true,
        require => Class['lemon::install']
  }

  file {'/etc/lemon/agent/transport/':
        ensure => directory,
        owner  => root,
        group  => root,
        purge  => true,
        recurse => true,
        require => Class['lemon::install']
  }



  file {'/etc/lemon/agent/sensors/':
        ensure => directory,
        owner  => root,
        group  => root,
        purge  => true,
        recurse => true,
        require => Class['lemon::install']
  }


  file {'/etc/lemon/exceptions':
        ensure => directory,
        owner  => root,
        group  => root,
        require => Class['lemon::install']
  }
  # We just want to create this file once at initialization.
  # if it does not exits. It is managed with lemon-host-check really.
  file {'/etc/lemon/exceptions/state.conf':
        ensure  => file,
        replace => false,
        content => "#Installed with puppet at initalization, managed with lemon-host-check after that.\n",
        owner   => 'root',
        group   => 'root',
        require => File['/etc/lemon/exceptions'],
        notify  => Class["lemon::service"]
  }

  Lemon::Virtual::Metric <|title == '20002'|>      # High Load.
  Lemon::Virtual::Metric <|title == '30008'|> {     # High Load Exception.:
     timing => 120,
  }
}
