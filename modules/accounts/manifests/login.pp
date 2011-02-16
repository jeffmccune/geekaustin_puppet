# This defined resource type will manage a login account.
#
# Example usage:
#
# Puppet will look for accounts::login in:
#   <modulepath>/accounts/manifests/login.pp
#
# accounts::login { "jeff":
#   uid => 601,
#   ssh_key => "...",
#   groups => [ "sysadmin", "sudoer", "sudoer_nopw" ],
# }
# 

define accounts::login(
  $uid,
  $username="UNSET",
  $ssh_key="# Unset SSH Key",
  $groups=["staff"]
) {

  if ($username == "UNSET") {
    $username_real = $name
  } else {
    $username_real = $username
  }

  group { "$username_real":
    ensure => present,
    gid => $uid,
  }

  user { "$username_real":
    ensure => present,
    uid => $uid,
    gid => $uid,
    home => "/home/$username_real",
    groups => $groups,
    comment => "Managed by Puppet ($username_real)",
    password => '!!',
  }

  # This sets the default attributes for all files in this
  # Defined type.
  File {
    owner => $username_real,
    group => $username_real,
    mode => 0644,
  }

  file { "/home/$username_real":
    ensure => directory,
    source => "/var/lib/puppet/skel",
    require => File["/var/lib/puppet/skel"],
    recurse => true,
    replace => false,
  }

  file { "/home/$username_real/.ssh":
    ensure => directory,
    mode => 0700,
  }
  file { "/home/$username_real/.ssh/authorized_keys":
    ensure => file,
    mode => 0644,
    content => "$ssh_key",
  }



}


