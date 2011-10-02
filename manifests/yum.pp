#License: GNU Public License v3, see COPYING.txt.

class lemon::yum {
   yumrepo {
      "lemon":
      descr    => "Lemon YUM Repository",
      # Next line should have a variable for the "6".
      baseurl  => "http://linuxsoft.cern.ch/lemon/linux/RPMS/x86_64/sl6/stable",
      gpgcheck => 0,
      enabled  => 1,
   }
}


