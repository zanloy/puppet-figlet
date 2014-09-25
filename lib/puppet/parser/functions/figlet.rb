module Puppet::Parser::Functions
  newfunction(:figlet, type: :rvalue) do |args|
    # Get arguments
    string = args[0]
    font = args[1]
    width = args[2]
    # Set default string
    string ||= "figlet"
    # Generate command to run
    cmd = "figlet #{string}"
    cmd += " -f #{font}" if font
    cmd += " -w #{width}" if width
    # Run command
    `#{cmd}`
  end
end
