#
# == Class: lemon::standard
#
# When the lemon class is enabled the following set of metrics
# are loaded. It is assumed that there is a set of metrics to be
# enabled everywhere and this file contains it.
#
# === Authors
# 
# Steve Traylen <steve.traylen@cern.ch>
#
# === Copyright
#
# Copyright 2012 CERN
#
class lemon::standard {

  lemon::metric{'4102':}
  lemon::metric{'4105':}
  lemon::metric{'4109':}
  lemon::metric{'4111':}
  lemon::metric{'4115':}
  lemon::metric{'5013':}
  lemon::metric{'9001':}
  lemon::metric{'9011':}
  lemon::metric{'9012':}
  lemon::metric{'9013':}
  lemon::metric{'9022':}
  lemon::metric{'9023':}
  lemon::metric{'9025':}
  lemon::metric{'9031':}
  lemon::metric{'9032':}
  lemon::metric{'9102':}
  lemon::metric{'9103':}
  lemon::metric{'9104':}
  lemon::metric{'9200':}
  lemon::metric{'9201':}
  lemon::metric{'9208':}
  lemon::metric{'10000':}
  lemon::metric{'10001':}
  lemon::metric{'10002':}
  lemon::metric{'10003':}
  lemon::metric{'10004':}
  lemon::metric{'10005':}
  lemon::metric{'10006':}
  lemon::metric{'10007':}
  lemon::metric{'10008':}
  lemon::metric{'20002':}
  lemon::metric{'20003':}
  lemon::metric{'30008': params=>{'Correlation' => "20002:1 > $::processorcount"}}
  lemon::metric{'30010':}
  lemon::metric{'30011':}
  lemon::metric{'30012':}
}
