#License: GNU Public License v3, see COPYING.txt.

class lemon::virtual {


  define sensor ($pkg,$commandline="",$user="",$env={},$supports ='CFG CHK SOD VER',$metricclasses) {

     $sensorname = $title
     file {"/etc/lemon/agent/sensors/$sensorname.conf":
              ensure  => present,
              owner   => 'root',
              group   => 'root',
              mode    => '0644',
              content => template("lemon/sensor.conf.erb"),
              require => Package[$pkg],
              notify  => Class["lemon::service"],

     }
     # The lemon sensor package in particular. 
     package { $pkg:
               ensure  => present,
               require => Class["lemon::install"],
               notify  => Class["lemon::service"],
     }
  }


  define metric ($sensor,$metricclass,$metricname,$smoothing=[],$timing=60,$params={},$optparams=[],$mandparams=[],$offset=0) {

     $metricid = $title


     file {"/etc/lemon/agent/metrics/$metricid.conf":
              ensure  => 'present',
              owner   => 'root',
              group   => 'root',
              mode    => '0644',
              content => template("lemon/metric.conf.erb"),
              require => Lemon::Virtual::Sensor[$sensor],
              notify  => Class["lemon::service"],
     }

     realize(Lemon::Virtual::Sensor[$sensor])
  }
}
