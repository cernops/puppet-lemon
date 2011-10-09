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

   $lemondeps = $operatingsystem ? {
      redhat  => '1',
      default => '0',
   }


   yumrepo {
      "lemondeps4rhel":
      descr    => "Lemon Dependencies on RHEL YUM Repository",
      # Next line should have a variable for the "6".
      baseurl  => "http://agileinf.web.cern.ch/agileinf/yum/lemondeps4rhel/6/x86_64/",
      gpgcheck => 0,
      enabled  => $lemondeps
   }




}


