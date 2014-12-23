# This manifest is to populate a file with static
# text generated from figlet. This is a very simple
# example and should be quite short for legibility.

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
