# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include qualys
class qualys {

  $usesudo            = '0'
  $sudouser           = 'root'
  $sudocommand        = 'sudo'
  $loglevel           = '3'
  $logfiledir         = '/var/log/qualys'
  $cmdmaxtimeout      = '1800'
  $processpriority    = '0'
  $requesttimeout     = '600'
  $useauditdispatcher = '1'
  $cmdstdoutsize      = '1024'
  $luascripttimeout   = '3600'
  $activationid       = 'c24767f8-1948-40b4-b6b7-589e5175c289'
  $customerid         = 'ee2eaba9-536d-4e68-815c-126069358167'
  $usergroup          = 'root'


  package { 'qualys-cloud-agent':
    ensure => 'installed',
  }

  file { '/tmp/qualys-cloud-agent.properties':
    ensure  => file,
    content => epp('qualys/properties.epp'),
    require => Package['qualys-cloud-agent'],
  }

  if $facts['compconfprop'] != 0 {
    file { '/tmp/qualys-cloud-agent.conf':
      ensure  => file,
      content => '',
      notify  => Service['qualys-cloud-agent.service'],
      require => [File['/tmp/qualys-cloud-agent.properties'],Package['qualys-cloud-agent']],
    }
  }

  service { 'qualys-cloud-agent.service':
    ensure  => running,
    enabled => true,
    require => Package['qualys-cloud-agent'],
  }
}
