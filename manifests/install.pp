#
# == Class: lemon::install
# 
# Installs the packages for lemon.
#
# === Author
# 
# Steve Traylen <steve.traylen@cern.ch>
# 
# === Copyright
#
# Copyright 2012 CERN
#
class lemon::install {

  case $::operatingsystem {
   Fedora:  { $lemon_yum  = "http://linuxsoft.cern.ch/lemon/linux/RPMS/${::architecture}/f16/stable"
              $lemon_pkgs = ['lemon-agent','lemon-host-check','lemon-cli']
            }
   default: { case $::osfamily {
                RedHat:  { $lemon_yum = "http://linuxsoft.cern.ch/lemon/linux/RPMS/${::architecture}/sl${::lsbmajdistrelease}/stable"
                           $lemon_pkgs = ['lemon-agent','lemon-host-check','lemon-cli']
                         }
                default: { fail('Could not determine sensible lemon repository to use')
                         }
              }
            }
  }


  package {$lemon_pkgs:
       ensure => latest,
       require => Yumrepo[ "lemon" ]
  }

  osrepos::ai121yumrepo {
    "lemon":
      descr    => "Lemon YUM Repository",
      # Next line should have a variable for the "6".
      baseurl  => $lemon_yum,
      gpgcheck => 0,
      enabled  => 1,
   }
}




