# Lemon Exceptions
# Display cached local exceptions.
# as a fact 'lemon_exceptions', comma delimited list.

if Facter.value(:id) == "root" and File.exists?('/usr/sbin/lemon-host-check') 
  Facter.add("lemon_exceptions")  do
    setcode do
       output = Facter::Util::Resolution.exec('/usr/sbin/lemon-host-check --noupdate --script')
       if not output.nil?
          output.split("\n").join(', ')
       end
    end
  end
end

