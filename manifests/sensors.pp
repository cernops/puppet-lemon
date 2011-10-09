#License: GNU Public License v3, see COPYING.txt.

class lemon::sensors{

  @lemon::virtual::sensor{'linux':
           pkg           => 'lemon-sensor-linux',
           commandline   => '/usr/libexec/sensors/lemon-sensor-linux',
           user          => 'root',
           metricclasses => ['system.CPUCount',
		             'system.CPUInfo',
		             'system.CPUutil',
		             'system.Os',
		             'system.bootTime',
		             'system.contextSwitches',
                             'system.createdProcesses',
		             'system.diskStats',
		             'system.existingProcesses',
		             'system.exitCode',
		             'system.interrupts',
		             'system.loadAvg',
		             'system.memoryShared',
		             'system.memoryStats',
		             'system.networkInterfaceIO',
		             'system.networkInterfaceInfo',
		             'system.numberOfProcesses',
		             'system.numberOfSockets',
		             'system.numberOfUsers',
		             'system.pagingIO',
		             'system.partitionInfo',
		             'system.partitionStats',
		             'system.partitionStatsSummary',
		             'system.processCount',
		             'system.processFDCount',
		             'system.processMemory',
		             'system.processUptime',
		             'system.swapIO',
		             'system.swapUsed',
		             'system.unmountedFilesystems',
		             'system.uptime']
  }


  @lemon::virtual::sensor{'exception':
           pkg           => 'lemon-sensor-exception',
           commandline   => '/usr/libexec/sensors/lemon-sensor-exception',
           env           => {'MR_SHORTHOSTNAME'   => 1,
                             'MR_SPOOLDIR'        => '/var/spool/edg-fmon-agent',
                             'MSA_SAMPLEONDEMAND' => '/var/run/edg-fmon-agent'
                            },
           metricclasses => ['alarm.exception']

  }


  # Start of MSA Sensor
  @lemon::virtual::sensor{'MSA':
           pkg           => 'openssl',
           metricclasses => ['MSA.Alive',
		             'MSA.CleanLocalCache',
		             'MSA.Footprint',
		             'MSA.HeartBeatTimeout',
		             'MSA.HostnameCheck',
		             'MSA.LogStats',
		             'MSA.SensorCheck',
                             'MSA.SensorVersions',
                             'MSA.Version']
  }
}


