#License: GNU Public License v3, see COPYING.txt.

class lemon::metrics::linux{

  @lemon::virtual::metric{'4102':
           sensor       => 'linux',
           metricname   => 'SharedMemory',
           metricclass  => 'system.memoryShared',
           timing       => 86400,
           smoothing    => {'Index'    => 0,
                            'Type'     => 'number',
                            'CacheAll' => 1,
                            'Maxdiff'  => 0.0,
                            'Maxtime'  => 518400
                           },
                  
  }        
  @lemon::virtual::metric{'4105':
           sensor       => 'linux',
           metricname   => 'NumberOfUsers',
           metricclass  => 'system.numberOfUsers',
           smoothing    => {'Index'    => 0,
                            'Type'     => 'number',
                            'CacheAll' => 1,
                            'Maxdiff'  => 0.0,
                            'Maxtime'  => 3000
                           }
  }        
  @lemon::virtual::metric{'4109':
           sensor       => 'linux',
           metricname   => 'OS',
           metricclass  => 'system.Os',
           timing       => 0,
  }        

  @lemon::virtual::metric{'4111':
           sensor       => 'linux',
           metricname   => 'NumberOfCpus',
           metricclass  => 'system.CPUCount',
           timing       => 86400,
           smoothing    => {'Index'    => 0,
                            'Type'     => 'number',
                            'CacheAll' => 1,
                            'Maxdiff'  => 0.0,
                            'Maxtime'  => 518400
                           },
  }

  @lemon::virtual::metric{'4115':
           sensor       => 'linux',
           metricname   => 'CPUInfo',
           metricclass  => 'system.CPUInfo',
           timing       => 86400,
           smoothing    => {'Index'    => 0,
                            'Type'     => 'string',
                            'CacheAll' => 1,
                            'Maxtime'  => 518400
                           },
  }

  @lemon::virtual::metric{'5013':
           sensor       => 'linux',
           metricname   => 'system.BootTime',
           metricclass  => 'system.bootTime',
           timing       => 0
  }

  @lemon::virtual::metric{'9001':
           sensor       => 'linux',
           metricname   => 'uptime',
           metricclass  => 'system.uptime',
           timing       => 3600,
           smoothing    => {'Index'    => 0,
                            'Type'     => 'number',
                            'CacheAll' => 1,
                            'Maxdiff'  => 0.0,
                            'Maxtime'  => 36000,
                           }
  }
  @lemon::virtual::metric{'9011':
           sensor       => 'linux',
           metricname   => 'CPUutil',
           metricclass  => 'system.CPUutil',
           timing       => 300
  }
  @lemon::virtual::metric{'9012':
           sensor       => 'linux',
           metricname   => 'interrupts',
           metricclass  => 'system.interrupts',
           timing       => 300
  }
  @lemon::virtual::metric{'9013':
           sensor       => 'linux',
           metricname   => 'contextSwitches',
           metricclass  => 'system.contextSwitches',
           timing       => 300
  }
  @lemon::virtual::metric{'9022':
           sensor       => 'linux',
           metricname   => 'swapIO',
           metricclass  => 'system.swapIO',
           timing       => 300
  }
  @lemon::virtual::metric{'9023':
           sensor       => 'linux',
           metricname   => 'pagingIO',
           metricclass  => 'system.pagingIO',
           timing       => 300
  }
  @lemon::virtual::metric{'9025':
           sensor       => 'linux',
           metricname   => 'memoryStats',
           metricclass  => 'system.memoryStats',
           timing       => 300
  }
  @lemon::virtual::metric{'9031':
           sensor       => 'linux',
           metricname   => 'existingProcesses',
           metricclass  => 'system.existingProcesses',
           timing       => 300,
           smoothing    => {'Index'    => 0,
                            'Type'     => 'number',
                            'CacheAll' => 1,
                            'Maxdiff'  => 0.0,
                            'Maxtime'  => 3000,
                           }

  }
  @lemon::virtual::metric{'9032':
           sensor       => 'linux',
           metricname   => 'createdProcesses',
           metricclass  => 'system.createdProcesses',
           timing       => 300
  }
  @lemon::virtual::metric{'9102':
           sensor       => 'linux',
           metricname   => 'PatitionStatsSummary',
           metricclass  => 'system.partitionStatsSummary',
           timing       => 300
  }
  @lemon::virtual::metric{'9103':
           sensor       => 'linux',
           metricname   => 'PartitonsStats',
           metricclass  => 'system.partitionStats',
           timing       => 300,
           smoothing    => {'Index'    => 0,
                            'Type'     => 'string',
                            'CacheAll' => 1,
                            'Maxtime'  => 36000,
                            'PrimaryKeys' => 1
                           }

  }
  @lemon::virtual::metric{'9104':
           sensor       => 'linux',
           metricname   => 'partitonInfo',
           metricclass  => 'system.partitionInfo',
           timing       => 300,
           smoothing    => {'Index'    => 0,
                            'Type'     => 'string',
                            'CacheAll' => 1,
                            'Maxtime'  => 36000,
                            'PrimaryKeys' => 1
                           }

  }

  @lemon::virtual::metric{'9200':
           sensor       => 'linux',
           metricname   => 'networkInterfaceInfo',
           metricclass  => 'system.networkInterfaceInfo',
           timing       => 21600
  }
  @lemon::virtual::metric{'9201':
           sensor       => 'linux',
           metricname   => 'numberOfSockets',
           metricclass  => 'system.networkInterfaceInfo',
           timing       => 300
  }
  @lemon::virtual::metric{'9208':
           sensor       => 'linux',
           metricname   => 'networkInterfaceIO',
           metricclass  => 'system.networkInterfaceIO',
           timing       => 300,
           params       => {'excludes' => 'lo sit0'},
           optparams     => ['excludes']
  }

  @lemon::virtual::metric{'20002':
           sensor       => 'linux',
           metricname   => 'LoadAvg',
           metricclass  => 'system.loadAvg',
           smoothing    => {'Index'    => 0,
                            'Type'     => 'number',
                            'CacheAll' => 1,
                            'Maxdiff'  => 0.5,
                            'Maxtime'  => 3600
         
                           },
                  
  }        

  @lemon::virtual::metric{'20003':
           sensor       => 'linux',
           metricname   => 'SwapUsed',
           metricclass  => 'system.swapUsed',
           timing      => 300,
           smoothing    => {'Index'    => 0,
                            'Type'     => 'number',
                            'CacheAll' => 1,
                            'Maxdiff'  => 3.0,
                            'Maxtime'  => 3600
                           },
                  
  }        
  @lemon::virtual::metric{'20047':
           sensor       => 'linux',
           metricname   => 'unmountedFilesystems',
           metricclass  => 'system.UnmountedFilesystems',
           timing      => 300,
           smoothing    => {'Index'    => 0,
                            'Type'     => 'number',
                            'CacheAll' => 1,
                            'Maxdiff'  => 3.0,
                            'Maxtime'  => 3600
                           },
  }        

  # End of lemon linux sensor.

}


