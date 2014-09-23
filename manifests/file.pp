class figlet::file (
  $path = $name,
  $text,
  $font = 'standard',
  $width = 180,
) {

  file { $path:
    content => figlet($text, $font, $width),
  }

}
