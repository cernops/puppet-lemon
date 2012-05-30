# == Define: lemon::sensor
#
# This type is not typically declared directley but is enabled
# from the lemon::sensor type.
#
# === Parameters
# 
# All sensor parameters allways come from hiera and hiera entry should
# be present for each lemon sensor.
#
#    lemonsensor_linux:
#        pkg:         lemon-sensor-linux
#        commandline: /usr/libexec/sensors/lemon-sensor-linux
#        user:        root
#        supports:    CFG CHK SOD VER
#        metricclasses:
#          - system.CPUCount
#          - system.CPUInfo
#
# === Examples
# 
# As stated this is not normally loaded but is autorequired from the
# the lemon::metric type.
#
# === Authors
#
# Steve Traylen <steve.traylen@cern.ch>
#
# === Copyright
#
# Copyright 2012 CERN
#
define lemon::sensor  {

  $sensorname = $title

  # defaults for here now.

  $sensorhash = hiera("lemonsensor_${sensorname}")
  $pkg = $sensorhash['pkg']
  if has_key($sensorhash,'user') {
    $user = $sensorhash['user']
  }
  if has_key($sensorhash,'commandline') {
    $commandline = $sensorhash['commandline']
  }
  $supports = $sensorhash['supports']

  $metricclasses = $sensorhash['metricclasses']
  if has_key($sensorhash,'env') {
     $env = $sensorhash['env']
  } else {
     $env = {}
  }
  

  file {"/etc/lemon/agent/sensors/$sensorname.conf":
          owner   => 'root',
          group   => 'root',
          mode    => '0644',
          content => template("lemon/sensor.conf.erb"),
          require => Package[$pkg],
          notify  => Class["lemon::service"],
  }
  # The lemon sensor package in particular. 
  package { $pkg:
     ensure  => $ensure,
     require => Class["lemon::install"],
     notify  => Class["lemon::service"],
  }
}
