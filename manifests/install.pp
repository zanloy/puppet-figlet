# This manifest is to install figlet package. It should generally
# only be installed on the puppet master server.

class figlet::install(
  $package = $figlet::params::package,
) inherits figlet::params {

  if $::osfamily == 'Redhat' {

    include repoforge

    package { $package:
      ensure  => present,
      require => Yumrepo['rpmforge'],
    }

  } else {

    package { $package:
      ensure => present,
    }

  }

}
