# == Define: lemon::metric
#
# This lemon::metric type creates a lemon metric on a box.
#
# === Parameters
# For any given metric it is expected that the vast majority of the metric
# parameters are loaded from hiera. For a particular metric the following
# hiera entry is expected to be present for metric.
#
#    lemon_4111:
#        sensor:      linux
#        metricname:  NumberOfCpus
#        metricclass: system.CPUCount
#        timing:      86400
#        smoothing:
#           Index: 0
#           Type: number
#           CacheAll: 1
#           Maxdiff: 0.0
#           Maxtime: 518400
#
# While some of these parameters can be overwritten with the parameters
# below not all items can be overwritten, e.g the package name for the sensor.
#
# [*namevar*]
#    The metric id of the metric, e.g 1234
#
# [*timing*]
#    The timeout for collecting the lemon metric. An integer in seconds.
# 
# [*smoothing*]
#    A hash containing the smoothing parameters, e.g 
#    smoothing => {'Index' => 0, 'Type' => 'number', 'CacheAll' => 1,
#                  'Maxdiff' => 0.0, 'Maxtime' => 518000}
#    Values passed in the smoothing hash are merged with the hash from hiera.
#    See params below for an example of merging.
#
# [*params*]
#    The parameters to pass to the metric, a hash is expected and it will merge
#    the values with that contained in heiera e.g.
#    params=>{'Correlation' => "20002:1 > $::processorcount"}
#    would be merged with an existing params from hiera of 
#    {'Correlation' => "20002:1 > 4",'MinOccurs' => '10'}
#    to result in
#    {'Correlation' => "20002:1 > $::processorcount",'MinOccurs' => '10'}
#
# [*offset*]
#    The time to wait after lemon-agent start up before collecting a metric.
# 
# === Examples
# 
# Enable a metric with all default values coming from hiera.
#
#   lemon::metric{'1234':}
# 
# Enable a metric overriding a value from hiera.
# 
#   lemon::metric{'1234': timing => 3000}
#
# === Authors
#  
# Steve Traylen <steve.traylen@cern.ch>
#
# === Copyright
#
# Copyright 2012 CERN.
#
define lemon::metric( $timing = undef , $smoothing = undef, $params = undef, $offset = undef ) {
  $metricid = $title

  # defaults here for work in progress.

  $metrichash = hiera("lemon_${metricid}") 

  #Chaeck the offset parameter, order is argument, hash then default.
  if ( $offset != undef ) {
    $my_offset = $offset
  } elsif has_key($metrichash,'offset') {
    $my_offset = $metrichash['offset']
  } else {
    $my_offset = 0
  }

  #Chaeck the params parameter, order is argument, hash then default.
  # Any arguments are merged ontop of the hiera values.
  if ( $params != undef ) and has_key($metrichash,'params') {
       $my_params = merge($metrichash['params'],$params)
  } elsif ( $params != undef ) {
    $my_params = $params
  } elsif has_key($metrichash,'params') {
    $my_params = $metrichash['params']
  } else {
    $my_params = undef
  }

  # Check the timing parameter, order is argument, hash then default.
  if ( $timing !=  undef) {
     $my_timing = $timing
  } elsif has_key($metrichash,'timing') {
     $my_timing = $metrichash['timing']
  } else {
     $my_timing = 60
  }
  # This check currently fails since the heira-puppet-functions returns a string even
  # in hiera itself returns an int. Is fixed , waiting on new release.
  #if ! is_integer($my_timing) {
    #fail("The timing parameter for a lemon metric must be an integer and not \"${my_timing}\"")
  #}
  # End of timing.

  # Check the smooting parameter, order is argument, hiera hash then default.
  # if a parameter and hiera hash then parameter is merged over hiera hash
  # to give the union.
  if ( $smoothing != undef ) and has_key($metrichash,'params') {
    $my_smoothing = merge($metrichash['params'],$smoothing)
  } elsif ( $smoothing != undef ) {
    $my_smoothing = $smoothing 
  } elsif has_key($metrichash,'smoothing') {
    $my_smoothing = $metrichash['smoothing']
  } else {
    $my_smoothing = undef
  }
  if  ( $my_smoothing != undef )  and  ! is_hash($my_smoothing)  {
    fail('The smoothing parameter was defined but is not a hash.')
  }

  $metricname = $metrichash['metricname']
  $metricclass = $metrichash['metricclass']
  $sensor     = $metrichash['sensor']


  file {"/etc/lemon/agent/metrics/${metricid}-${metricname}.conf":
          owner   => 'root',
          group   => 'root',
          mode    => '0644',
          content => template("lemon/metric.conf.erb"),
          require => Lemon::Sensor[$sensor],
          notify  => Class["lemon::service"],
  }

  if ! defined(Lemon::Sensor["${sensor}"])  {
      lemon::sensor{"${sensor}":}
  }

}
