class figlet::fonts::install (
  $font = $name,
  $path = $figlet::params::fontdir,
  $url = "",
) inherits figlet::params {

  define remote_file ( $remote_location=undef, $mode='0644' ) {
    exec { "retrieve_${title}":
      command => "/usr/bin/wget -q ${remote_location} -O ${title}",
      creates => $title,
    }

    file{ $title:
      mode    => $mode,
      require => Exec["retrieve_${title}"],
    }
  }

  if $url == "" {
    $url_set = "ftp://ftp.figlet.org/pub/figlet/fonts/contributed/${font}.flf"
  } else {
    $url_set = $url
  }

  #remote_file { 
}
