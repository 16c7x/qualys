# qualys

This module installs the Qualys Agent. 

## Setup

### Requirements
The Qualys Puppet module supports Linux and is compatible with version >= 2018.1.0 For detailed information on compatibility.


| variable name                           | description                                                                                                                                                                                      |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `agent_major_version`                   | The version of the Agent to install: either 5, 6 or 7 (default: 7).                                                                                                                              |
| `agent_version`                         | Lets you pin a specific minor version of the Agent to install, for example: `1:7.16.0-1`. Leave empty to install the latest version.                                                             |
| `collect_ec2_tags`                      | Collect an instance's custom EC2 tags as Agent tags by using `true`.                                                                                                                             |
| `collect_instance_metadata`             | Collect an instance's EC2 metadata as Agent tags by using `true`.                                                                                                                                |
| `datadog_site`                          | The Datadog site to report to. Defaults to `datadoghq.com`, set to `datadoghq.eu` to report to the EU site (Agent v6 and v7 only).                                                               |
| `dd_url`                                | The Datadog intake server URL. You are unlikely to need to change this. Overrides `datadog_site`                                                                                                 |
| `host`                                  | Overrides the node's host name.                                                                                                                                                                  |
| `local_tags`                            | An array of `<KEY:VALUE>` strings that are set as tags for the node.                                                                                                                             |
| `non_local_traffic`                     | Allow other nodes to relay their traffic through this node.                                                                                                                                      |
| `apm_enabled`                           | A boolean to enable the APM Agent (defaults to false).                                                                                                                                           |
| `apm_analyzed_spans`                    | A hash to add APM events for trace search & analytics (defaults to undef), for example:<br>`{ 'app\|rails.request' => 1, 'service-name\|operation-name' => 0.8 }`                                |
| `process_enabled`                       | A boolean to enable the process Agent (defaults to false).                                                                                                                                       |
| `scrub_args`                            | A boolean to enable the process cmdline scrubbing (defaults to true).                                                                                                                            |
| `custom_sensitive_words`                | An array to add more words beyond the default ones used by the scrubbing feature (defaults to `[]`).                                                                                             |
| `logs_enabled`                          | A boolean to enable the logs Agent (defaults to false).                                                                                                                                          |
| `container_collect_all`                 | A boolean to enable logs collection for all containers.                                                                                                                                          |
| `agent_extra_options`<sup>1</sup>       | A hash to provide additional configuration options (Agent v6 and v7 only).                                                                                                                       |
| `hostname_extraction_regex`<sup>2</sup> | A regex used to extract the hostname captured group to report the run in Datadog instead of reporting the Puppet nodename, for example:<br>`'^(?<hostname>.*\.datadoghq\.com)(\.i-\w{8}\..*)?$'`


| Variable name                     |
|               
|-----------------------------------|-----------------------------------------------------------------------------------|
| usesudo                           | 0 or 1
|
| sudouser                          |scanuser
|
| sudocommand                       |cmd
|
| log_level                         | a number between 0 and 5
|
| logfiledir                        | directory where the log file should be created.Please make sure this directory should be accessible for agent user.
|
| cmdmaxtimeout                     | command max wait-time in seconds
|
| processpriority                   | -20 to 19
|
| requesttimeout                    | command max wait-time in seconds
|
| useauditdispatcher                | 0 or 1
|
| cmdstdoutsize                     | command std output size in KB, default value is 1024 and max limit is 5120
|
| luascripttimeout                  | max wait-time in seconds
|
| activationid                      | xxxx-xx-xxxxxxx
|
| customerid                        | xxxx-xx-xxxxxxx
|
| usergroup                         | scangroup
