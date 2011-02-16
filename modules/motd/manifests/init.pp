# Message of the Day class
class motd {

  # "declare" a file resource to model the motd
  file { "/etc/motd":
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 0644,
    content => template("${module_name}/motd.erb"),
  }

}

