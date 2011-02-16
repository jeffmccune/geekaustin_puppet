# The class motd lives in <modulepath>/motd/manifests/init.pp
# This class manages the message of the day

class motd {

  # This will use the template from <modulepath>/motd/tempaltes/motd.erb
  file { "/etc/motd":
    owner => root,
    group => root,
    mode => 0644,
    content => template("${module_name}/motd.erb"),
  }

}
