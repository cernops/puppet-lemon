#License: GNU Public License v3, see COPYING.txt.

class lemon::config (
   $lemonservers = $lemon::params::lemonservers
 ) inherits lemon::params {
  class {'lemon::virtual':}
  class {'lemon::sensors':}
  class {'lemon::metrics::linux':}
  class {'lemon::metrics::exception':}
  class {'lemon::metrics::msa':}

  # Realize standard metrics for all hosts.
  class {'lemon::standard':}

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


  Lemon::Virtual::Metric <|metricname == 'SharedMemory'|>
  Lemon::Virtual::Metric <|metricname == 'NumberOfUsers'|>
  Lemon::Virtual::Metric <|metricname == 'OS'|>
  Lemon::Virtual::Metric <|metricname == 'NumberOfCpus'|>
  Lemon::Virtual::Metric <|metricname == 'CPUInfo'|>
  Lemon::Virtual::Metric <|metricname == 'system.BootTime'|>
  Lemon::Virtual::Metric <|metricname == 'uptime'|>
  Lemon::Virtual::Metric <|metricname == 'CPUutil'|>
  Lemon::Virtual::Metric <|metricname == 'interrupts'|>
  Lemon::Virtual::Metric <|metricname == 'contextSwitches'|>
  Lemon::Virtual::Metric <|metricname == 'swapIO'|>
  Lemon::Virtual::Metric <|metricname == 'pagingIO'|>
  Lemon::Virtual::Metric <|metricname == 'memoryStats'|>
  Lemon::Virtual::Metric <|metricname == 'existingProcesses'|>
  Lemon::Virtual::Metric <|metricname == 'createdProcesses'|>
  Lemon::Virtual::Metric <|metricname == 'PatitionStatsSummary'|>
  Lemon::Virtual::Metric <|metricname == 'PartitonsStats'|>
  Lemon::Virtual::Metric <|metricname == 'PartitonsInfo'|>
  Lemon::Virtual::Metric <|metricname == 'networkInterfaceInfo'|>
  Lemon::Virtual::Metric <|metricname == 'numberOfSockets'|>
  Lemon::Virtual::Metric <|metricname == 'networkInterfaceIO'|>
  Lemon::Virtual::Metric <|metricname == 'LoadAvg'|>
  Lemon::Virtual::Metric <|metricname == 'SwapUsed'|>
  Lemon::Virtual::Metric <|metricname == 'UnmountedFilesystems'|>

  # Exceptions.
  Lemon::Virtual::Metric <|metricname == 'exception.high_load'|>

  # MSA Ones.
  Lemon::Virtual::Metric <|sensor  == 'MSA'|> 

}
