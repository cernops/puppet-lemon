#License: GNU Public License v3, see COPYING.txt.

class lemon::metrics{
  class{'lemon::virtual':}


  @lemon::virtual::sensor{'linux':
           pkg           => 'lemon-sensor-linux',
           commandline   => '/usr/libexec/sensors/lemon-sensor-linux',
           user          => 'root',
           metricclasses => ['system.loadAvg']
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

  # End of lemon linux sensor.


  @lemon::virtual::sensor{'exception':
           pkg           => 'lemon-sensor-exception',
           commandline   => '/usr/libexec/sensors/lemon-sensor-exception',
           env           => {'MR_SHORTHOSTNAME'   => 1,
                             'MR_SPOOLDIR'        => '/var/spool/edg-fmon-agent',
                             'MSA_SAMPLEONDEMAND' => '/var/run/edg-fmon-agent'
                            },
           metricclasses => ['alarm.exception']

  }


  # Below should use a fact.
  @lemon::virtual::metric{'30008':
           sensor       => 'exception',
           metricname   => 'exception.high_load',
           metricclass  => 'alarm.exception',
           optparams    => ['MinOccurs'],
           mandparams   => ['Correlation'],
           params       => { 'Correlation' => "20002:1 > $processorcount",
                             'MinOccurs'   => 10
                          },
           smoothing    => {'Index'    => 0,
                            'Type'     => string,
                            'CacheAll' => 1,
                            'OnValue'  => '0 000 (null)',
                            'MaxTime'  => 36000
                           }
  }
  # End of lemon exception sensor.

}


