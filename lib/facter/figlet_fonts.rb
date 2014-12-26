if File.directory? '/usr/share/figlet/fonts'
  fontdir = '/usr/share/figlet/fonts/'
else
  fontdir = '/usr/share/figlet/'
end

entries = Dir.glob("#{fontdir}*.flf").map { |file| File.basename(file, '.flf') }.sort

Facter.add('figlet_fonts') do
  setcode do
    Facter.version > '2' ? entries : entries.join(', ')
  end
end
