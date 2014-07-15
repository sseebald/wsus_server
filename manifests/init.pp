class wsus_server {
  
  reboot { 'before':
    when => pending,
  }

  Dism {
    ensure => present,
  }

  dism { 'IIS-WebServerRole': } ->
  dism { 'IIS-WebServer': } ->
  dism { 'IIS-WebServerManagementTools': } ->
  dism { 'IIS-IIS6ManagementCompatibility': } ->
  dism { 'IIS-ISAPIFilter': } ->
  dism { 'IIS-ISAPIExtensions': } ->
  dism { 'IIS-NetFxExtensibility': } ->
  dism { 'IIS-ASPNET': } ->
  dism { 'IIS-WindowsAuthentication': } ->
  dism { 'IIS-HttpCompressionDynamic': } ->
  dism { 'NetFx3': } ->
  dism { 'WAS-WindowsActivationService': } ->
  dism { 'WAS-ConfigurationAPI': } ->
  dism { 'WAS-NetFxEnvironment': } ->
  dism { 'WAS-ProcessModel': }

  reboot { 'after':
    subscribe => Dism['WAS-ProcessModel'],
  }

  dism { 'AppServer': } 
}
