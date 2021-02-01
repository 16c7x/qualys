[![Build Status](https://img.shields.io/travis/16c7x/qualys/master.svg?style=flat-square)](https://travis-ci.org/16c7x/qualys)
[![Puppet Forge](https://img.shields.io/puppetforge/v/16c7x/qualys.svg?style=flat-square)](https://forge.puppetlabs.com/16c7x/qualys)


# qualys

This module installs the Qualys Agent.
A change

## Setup

### Requirements
The Qualys Puppet module supports Linux and is compatible with version >= 2018.1.0 For detailed information on compatibility.



| Variable name                     | Description                                                                       |
|-----------------------------------|-----------------------------------------------------------------------------------|
| usesudo                           | 0 or 1                                                                            |
| sudouser                          |scanuser                                                                           |
| sudocommand                       |cmd                                                                                |
| log_level                         | a number between 0 and 5                                                          |
| logfiledir                        | directory where the log file should be created.Please make sure this directory should be accessible for agent user.|
| cmdmaxtimeout                     | command max wait-time in seconds                                                  |
| processpriority                   | -20 to 19                                                                         |
| requesttimeout                    | command max wait-time in seconds                                                  |
| useauditdispatcher                | 0 or 1                                                                            |
| cmdstdoutsize                     | command std output size in KB, default value is 1024 and max limit is 5120        |
| luascripttimeout                  | max wait-time in seconds                                                          |
| activationid                      | xxxx-xx-xxxxxxx                                                                   |
| customerid                        | xxxx-xx-xxxxxxx                                                                   |
| usergroup                         | scangroup                                                                         |
