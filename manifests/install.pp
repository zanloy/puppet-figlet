class figlet::install(
  $package = $figlet::params::package,
) inherits figlet::params {

  if $::osfamily == 'Redhat' {

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
