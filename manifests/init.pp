# == Class: lemon
#
# Enable this class to configure lemon metrics and exceptions.
# The lemon::standard class below will enable a default set of
# lemon metrics and exceptions.
#
# Examples
# class { lemon'} 
# lemon::metric{'1234': timing => '1000'}
#
# This will enable up metric with id 1234  from
# a hiera backend database and override the timing parameter.
#
# === Authors
#
# Steve Traylen <steve.traylen@cern.ch> 
# 
# === Copyright
# CERN 2012.
#
class lemon {
   case $osfamily {
      RedHat: {
         class{'lemon::install': }
         class{'lemon::config': }
         class{'lemon::service': }
         class{'lemon::las': }
         # Realize standard metrics for all hosts.
         class{'lemon::standard':}
      }
      default: {
         # Lemon is only currently supported on RedHat based machines
         # Patches are, of course, welcomed :-)

         # I'm ignoring the fact there's an aix and solaris dir on linuxsoft
      }
   }
}
