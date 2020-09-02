# @sumary
# 
# This class installes and configures the Qualys agent.
#
# It is important to note that this class requires an activationid and clientid
# to be specified.
#
# @example
# class { '::qualys':
#   activationid => 'c24767f8-1948-40b4-b6b7-589e5175c289',
#   customerid   => 'c24767f8-1948-40b4-b6b7-589e5175c289',
# }
# 
# @usesudo
#   Should commands use sudo.
# 
# @sudouser
#   If sudo is to be used define the user.
#
# @sudocommand
#   The command to run sudo.
#
# @log_level
#
#
# @logfiledir
#
#
# @cmdmaxtimeout
#
#
# @processpriority
#
#
# @requesttimeout
#
#
# @useauditdispatcher
#
#
# @cmdstdoutsize
#
#
# @luascripttimeout
#
#
# @activationid
#
#
# @customerid
#
#
# @usergroup
#
#
class qualys (
  String              $usesudo            = '0',
  String              $sudouser           = 'root',
  String              $sudocommand        = 'sudo',
  String              $log_level           = '3',
  String              $logfiledir         = '/var/log/qualys',
  String              $cmdmaxtimeout      = '1800',
  String              $processpriority    = '0',
  String              $requesttimeout     = '600',
  String              $useauditdispatcher = '1',
  String              $cmdstdoutsize      = '1024',
  String              $luascripttimeout   = '3600',
  String              $activationid       = undef,
  String              $customerid         = undef,
  String              $usergroup          = 'root',
) {

  if $activationid != undef {
    err('Activation ID must be set')
  }

  if $customerid != undef {
    err('Customer ID must be set')
  }

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
              ['LogLevel', $log_level],
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



