# compconfprop.rb
# Compare /etc/qualys/cloud-agent/qualys-cloud-agent.conf and /etc/qualys/cloud-agent/qualys-cloud-agent.properties
# return a non zero if they don't match.


Facter.add('compconfprop') do
    setcode do
      Facter::Core::Execution.exec('cmp -s /etc/qualys/cloud-agent/qualys-cloud-agent.conf /etc/qualys/cloud-agent/qualys-cloud-agent.properties; echo $?')
    end
  end