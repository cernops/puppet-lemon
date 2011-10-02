Puppet module for managing lemon configurations.

License: GNU Public License v3, see COPYING.txt.
 
LEMON - LHC Era Monitoring - http://cern.ch/lemon

To enable this module it requires.

class { 'lemon': lemonservers => [lemon1.example.org,lemon2.example.org]}

Enable metrics optinally overriding defaults.

# High Load.
Lemon::Virtual::Metric <|title == '20002'|>   
# High Load Exception
Lemon::Virtual::Metric <|title == '30008'|> { 
     timing => 120,
}

Each of the sensors and metrics are defined in the file metrics.tpl.
All available metrics and sensors are defined as virtual resources
and the above spaceship operator will enable the metic where you
want them. The correct sensor will be enabled automatically including
installation of the package.

Steve Traylen, steve.traylen@cern.ch, 2nd October 2011.
