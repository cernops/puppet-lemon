#License: GNU Public License v3, see COPYING.txt.

class lemon::install {
  include lemon::yum
  package {"lemon-agent":
       ensure => latest,
       require => [Yumrepo[ "lemon" ], Yumrepo["lemondeps4rhel"]],
  }
  package {"lemon-cli":
       ensure => latest,
       require => Yumrepo[ "lemon" ]
  }
  # Lemon Sensors may or may not be needed.


}




