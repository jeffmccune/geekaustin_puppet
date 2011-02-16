# Class to manage the NTP package, file and service.
class ntp($server="pool.ntp.org") {

  package { "ntp":
    ensure => present,
  }

  file { "/etc/ntp.conf":
    ensure => file,
    owner => root,
    group => root,
    mode => 0644,
    content => template("${module_name}/ntp.conf"),
  }

  service { "ntpd":
    ensure => running,
    enable => true,
  }

  # Manage relationships among resources
  Package["ntp"]        ~> Service["ntpd"]
  Package["ntp"]        -> File["/etc/ntp.conf"]
  File["/etc/ntp.conf"] ~> Service["ntpd"]

}
