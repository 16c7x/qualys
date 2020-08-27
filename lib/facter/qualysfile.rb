# Creates the fact qualysfile which is a hash of the key=value pairs in the 
# /etc/qualys/cloud-agent/qualys-cloud-agent.conf file
# Reads the file line by line, ignoring comment lines.
# Splits the line at the = and adds both sides to the hash.
# removes commas and line endings. 
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