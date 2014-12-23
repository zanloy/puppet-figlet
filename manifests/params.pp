class figlet::params {

  case $::osfamily {
    'Archlinux': {
      $package = 'figlet'
      $fontdir = '/usr/share/figlet/fonts/'
    }
    'Debian': {
      $package = 'figlet'
      $fontdir = '/usr/share/figlet/'
    }
    'Redhat': {
      $package = 'figlet'
      $baseurl = "http://apt.sw.be/redhat/el${::operatingsystemmajrelease}/en/${::architecture}"
      $fontdir = '/usr/share/figlet/'
    }
    default: {
      fail("Figlet does not currently support the osfamily ${::osfamily}.")
    }
  }

}
