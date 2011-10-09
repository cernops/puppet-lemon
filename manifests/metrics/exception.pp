#License: GNU Public License v3, see COPYING.txt.

class lemon::metrics::exception{


  @lemon::virtual::metric{'30008':
           sensor       => 'exception',
           metricname   => 'exception.high_load',
           metricclass  => 'alarm.exception',
           optparams    => ['MinOccurs'],
           mandparams   => ['Correlation'],
           params       => {'Correlation' => "20002:1 > $::processorcount",
                            'MinOccurs'   => 10
                           },
           smoothing    => {'Index'    => 0,
                            'Type'     => string,
                            'CacheAll' => 1,
                            'OnValue'  => '0 000 (null)',
                            'MaxTime'  => 36000
                           }
  }
}


