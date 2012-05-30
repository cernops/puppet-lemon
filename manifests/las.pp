# == Class: lemon::las
#
# Lemon client interactions with lemon alarm system.
#
# === Author
# Veronique 
# Steve Traylen <steve.traylen@cern.ch>
#
# === Copyright
#
# Copyright 2012 Steve Traylen
#
class lemon::las {

  file{'/etc/facter/facts.d/alarmed.txt':
     ensure  => 'present',
     content => "alarmed=$::alarmed\n",
     require => File['/etc/facter/facts.d']
  }

  # If there are lemon exceptions in the fact add it to the report.
  if $::lemon_exceptions {
      notify {"lemon_exceptions":
          message  => "Lemon exceptions present $::lemon_exceptions",
          withpath => false
      }
  }

  # Validate $alarmed value
  case $::alarmed {
    /true|false/: {
       debug("The alarmed flag variable is set to $::alarmed")
    }
    default: {
       fail("The alarmed flag variable is not set to true or false")
    }
  }
}
