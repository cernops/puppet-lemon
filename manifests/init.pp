#License: GNU Public License v3, see COPYING.txt.

class lemon(
  $lemonservers = $lemon::params::lemonservers
  ) inherits lemon::params {

  class{'lemon::install': }
  class{'lemon::config': lemonservers => $lemonservers }
  class{'lemon::service': }

}
