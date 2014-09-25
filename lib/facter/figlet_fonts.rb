if File.directory? '/usr/share/figlet/fonts'
  fontdir = '/usr/share/figlet/fonts/'
else
  fontdir = '/usr/share/figlet/'
end

entries = Dir.glob("#{fontdir}*.flf").map { |file| File.basename(file, '.flf') }.sort

Facter.add('figlet_fonts') do
  setcode do
    entries.join(', ')
  end
end

if Facter.version > '2' do
  Facter.add('figlet_fonts_array') do
    setcode do
      entries
    end
  end
end
