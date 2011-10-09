# Puppet module for managing lemon configurations.

## Author
Steve Traylen, steve.traylen@cern.ch, CERN, Switzerland.

## Location
https://github.com/traylenator/puppet-lemon

##License
GNU Public License v3, see COPYING.txt.
 
## Information on LEMON 
LHC Era Monitoring - http://cern.ch/lemon

## Enable the Module
To enable this module it requires.

    class { 'lemon': lemonservers => [lemon1.example.org,lemon2.example.org]}

currently this enables a standard set of metrics as configured in

## Enable Pre Configured Metrics on a Node.
Enable metrics optinally overriding defaults.

    #Enable a metric by metric name
    Lemon::Virtual::Metric <|metricname == 'OS'|>

    #Enable a metric by metric id.
    Lemon::Virtual::Metric <|title == '20002'|>   

    #Enable a metric overriding a default.
    Lemon::Virtual::Metric <|title == '30008'|> { 
     timing => 120,
    }

    #Enable all configured metrics for a particular sensor.
    Lemon::Virtual::Metric <|sensor  == 'MSA'|>

## Adding Metrics and Sensors Virtually.
Each of the sensors and metrics can be predefined with defaults.

All available metrics and sensors are defined as virtual resources
and the above spaceship operator will enable the metric where you
want them. The correct sensor will be enabled automatically including
installation of the package.

### Configuring a New Sensor.
Sensors are configured withing lemon::sensors. The attribute pkg defines the package
to be installed for the sensor.

      @lemon::virtual::sensor{'exception':
           pkg           => 'lemon-sensor-exception',
           commandline   => '/usr/libexec/sensors/lemon-sensor-exception',
           env           => {'MR_SHORTHOSTNAME'   => 1,
                             'MR_SPOOLDIR'        => '/var/spool/edg-fmon-agent',
                             'MSA_SAMPLEONDEMAND' => '/var/run/edg-fmon-agent'
                            },
           metricclasses => ['alarm.exception']
    }

### Configuring a New Metric.
Metrics are configured per sensor in lemon::metrics::linux, exception,...


    @lemon::virtual::metric{'9208':
           sensor       => 'linux',
           metricname   => 'networkInterfaceIO',
           metricclass  => 'system.networkInterfaceIO',
           timing       => 300,
           params       => {'excludes' => 'lo sit0'},
           optparams    => ['excludes'],
           smoothing    => {'Index'    => 0,
                            'Type'     => 'number',
                            'CacheAll' => 1,
                            'Maxdiff'  => 0.5,
                            'Maxtime'  => 3600
         
                           },
    }




Steve Traylen, steve.traylen@cern.ch, 2nd October 2011.
