class figlet::install(
  $package = $figlet::params::package,
) inherits figlet::params {

  if $::osfamily == 'Redhat' {

    if ! defined(Class['repoforge']) {
      fail("To install figlet in RedHat, you need to also install repoforge module: puppet module install yguenane/repoforge")
    }

    include repoforge

    package { $package:
      ensure => present,
      require => Yumrepo['rpmforge'],
    }

  } else {

    package { $package:
      ensure => present,
    }

  }

}
