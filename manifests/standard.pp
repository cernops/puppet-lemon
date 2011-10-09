#License: GNU Public License v3, see COPYING.txt.

class lemon::standard {


  Lemon::Virtual::Metric <|metricname == 'SharedMemory'|>
  #realize(Lemon::Virtual::Metric['4102'])
  Lemon::Virtual::Metric <|metricname == 'NumberOfUsers'|>
  Lemon::Virtual::Metric <|metricname == 'OS'|>
  Lemon::Virtual::Metric <|metricname == 'NumberOfCpus'|>
  Lemon::Virtual::Metric <|metricname == 'CPUInfo'|>
  Lemon::Virtual::Metric <|metricname == 'system.BootTime'|>
  Lemon::Virtual::Metric <|metricname == 'uptime'|>
  Lemon::Virtual::Metric <|metricname == 'CPUutil'|>
  Lemon::Virtual::Metric <|metricname == 'interrupts'|>
  Lemon::Virtual::Metric <|metricname == 'contextSwitches'|>
  Lemon::Virtual::Metric <|metricname == 'swapIO'|>
  Lemon::Virtual::Metric <|metricname == 'pagingIO'|>
  Lemon::Virtual::Metric <|metricname == 'memoryStats'|>
  Lemon::Virtual::Metric <|metricname == 'existingProcesses'|>
  Lemon::Virtual::Metric <|metricname == 'createdProcesses'|>
  Lemon::Virtual::Metric <|metricname == 'PatitionStatsSummary'|>
  Lemon::Virtual::Metric <|metricname == 'PartitonsStats'|>
  Lemon::Virtual::Metric <|metricname == 'PartitonsInfo'|>
  Lemon::Virtual::Metric <|metricname == 'networkInterfaceInfo'|>
  Lemon::Virtual::Metric <|metricname == 'numberOfSockets'|>
  Lemon::Virtual::Metric <|metricname == 'networkInterfaceIO'|>
  Lemon::Virtual::Metric <|metricname == 'LoadAvg'|>
  Lemon::Virtual::Metric <|metricname == 'SwapUsed'|>
  Lemon::Virtual::Metric <|metricname == 'UnmountedFilesystems'|>

  # Exceptions.
  Lemon::Virtual::Metric <|metricname == 'exception.high_load'|>

  # MSA Ones, we can enable all the configured  metrics for
  # this sensor in one go.
  Lemon::Virtual::Metric <|sensor  == 'MSA'|> 

}
