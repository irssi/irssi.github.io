Irssi::signal_add_first("print text", sub {
  for ($_[1]) { $_ .= '     ' if /\cD(?!.....)/ } &Irssi::signal_continue })
