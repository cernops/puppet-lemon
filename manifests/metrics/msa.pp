#License: GNU Public License v3, see COPYING.txt.

class lemon::metrics::msa{

  # Start of MSA Sensor
  @lemon::virtual::metric{'10000':
           sensor       => 'MSA',
           metricname   => 'MSAVersion',
           metricclass  => 'MSA.Version',
           timing       => '86400',
           smoothing    => {'Index'    => 0,
                            'Type'     => string,
                            'CacheAll' => 1,
                            'MaxTime'  => 518400
                           }
  }

  @lemon::virtual::metric{'10001':
           sensor       => 'MSA',
           metricname   => 'CleanLocalCache',
           metricclass  => 'MSA.CleanLocalCache',
           timing       => '86400',
           params       => {'expiry' => 7,
                            'path'   => '/var/spool/lemon-agent'
                           },
           mandparams   => ['expiry','path'],
           smoothing    => {'Index'    => 0,
                            'Type'     => 'number',
                            'MaxDiff'  => 0.0,
                            'CacheAll' => 1,
                            'MaxTime'  => 518400
                           }
  }
  @lemon::virtual::metric{'10002':
           sensor       => 'MSA',
           metricname   => 'SensorVersions',
           metricclass  => 'MSA.SensorVersions',
           timing       => 86400,
           offset       => 5,
           smoothing    => {'Index'       => 0,
                            'Type'        => string,
                            'CacheAll'    => 1,
                            'MaxTime'     => 518400,
                            'PrimaryKeys' => 2
                           }
  }
  @lemon::virtual::metric{'10003':
           sensor       => 'MSA',
           metricname   => 'alive',
           metricclass  => 'MSA.Alive',
           timing       => 600,
           offset       => 5,
           smoothing    => {'Index'       => 0,
                            'Type'        => string,
                            'CacheAll'    => 1,
                            'MaxTime'     => 518400,
                           }
  }
  @lemon::virtual::metric{'10004':
           sensor       => 'MSA',
           metricname   => 'Footprint',
           metricclass  => 'MSA.Footprint',
           timing       => 600,
           offset       => 5,
  }
  @lemon::virtual::metric{'10005':
           sensor       => 'MSA',
           metricname   => 'HeartBeatTimeout',
           metricclass  => 'MSA.HeartBeatTimeout',
           timing       => '300',
           offset       => '5',
           params       => {'timeout' => 660,
                           },
           mandparams   => ['timeout'],
  }
  @lemon::virtual::metric{'10006':
           sensor       => 'MSA',
           metricname   => 'SensorCheck',
           metricclass  => 'MSA.SensorCheck',
           timing       => '900',
           offset       => '5',
           params       => {'timeout' => 30,
                           },
           mandparams   => ['timeout'],
           smoothing    => {'Index'       => 0,
                            'Type'        => string,
                            'CacheAll'    => 1,
                            'MaxTime'     => 9000,
                           }

  }
  @lemon::virtual::metric{'10007':
           sensor       => 'MSA',
           metricname   => 'LogStats',
           metricclass  => 'MSA.LogStats',
           timing       => '300',
           smoothing    => {'Index'       => 0,
                            'Type'        => string,
                            'CacheAll'    => 1,
                            'MaxTime'     => 3600,
                           }

  }
  @lemon::virtual::metric{'10008':
           sensor       => 'MSA',
           metricname   => 'HostnameCheck',
           metricclass  => 'MSA.HostnameCheck',
           timing       => '120',
           smoothing    => {'Index'       => 0,
                            'Type'        => number,
                            'CacheAll'    => 1,
                            'MaxTime'     => 86400,
                           }

  }


}


