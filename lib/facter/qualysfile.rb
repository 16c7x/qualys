# compconfprop.rb
# Compare /etc/qualys/cloud-agent/qualys-cloud-agent.conf and /etc/qualys/cloud-agent/qualys-cloud-agent.properties
# return a non zero if they don't match.


Facter.add('qualysfile') do
  setcode do
    qualysfile = {}
    filecontents = File.open('/etc/qualys/cloud-agent/qualys-cloud-agent.conf').read
    filecontents.each_line do |line|
      if line.include? "#"
      else
        a = line.split("=")
        qualysfile[a[0]] = a[1].chomp
      end
    end
    qualysfile
  end
end