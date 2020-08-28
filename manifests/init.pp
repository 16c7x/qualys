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

  file { '/etc/qualys/cloud-agent/qualys-cloud-agent.conf':
    ensure  => file,
    content => epp('qualys/properties.epp'),
    require => Package['qualys-cloud-agent'],
    notify  => Service['qualys-cloud-agent.service'],
  }

  service { 'qualys-cloud-agent.service':
    ensure  => running,
    enable  => true,
    require => Package['qualys-cloud-agent'],
  }

  file { '/etc/qualys/cloud-agent/qualys-cloud-agent.properties':
    ensure  => file,
  }

  $configs = [['UseSudo', $usesudo],
              ['SudoUser', $sudouser],
              ['SudoCommand', $sudocommand],
              ['LogLevel', $loglevel],
              ['LogFileDir', $logfiledir],
              ['CmdMaxTimeOut', $cmdmaxtimeout],
              ['ProcessPriority', $processpriority],
              ['RequestTimeOut', $requesttimeout],
              ['UseAuditDispatcher', $useauditdispatcher],
              ['CmdStdOutSize', $cmdstdoutsize],
              ['LuaScriptTimeOut', $luascripttimeout],
              ['ActivationId', $activationid],
              ['CustomerId', $customerid],
              ['UserGroup', $usergroup]
              ]

  $configs.each |$configs| {
    if $configs[1] != $facts['qualysfile'][$configs[0]] {
      file_line { $configs[0]:
        path    => '/etc/qualys/cloud-agent/qualys-cloud-agent.properties',
        line    => "${configs[0]}=${configs[1]}",
        require => [Package['qualys-cloud-agent'], File['/etc/qualys/cloud-agent/qualys-cloud-agent.properties']],
        before  => File['/etc/qualys/cloud-agent/qualys-cloud-agent.conf'],
      }
    }
  }
}



