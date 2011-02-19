# Login account defined resource type.
# This type models a login account for your infrastructure.
# We won't bother to setup any passwords and instead rely on SSH keys.
#
# Example Usage:
#
#  account::login { "jeff":
#    uid      => 601,
#    ssh_keys => [ "..." ],
#  }

define account::login(
  $username = "UNSET",
  $groups   = [ "sysadmin" ],
  $ssh_key  = "# No key defined",
  $uid)
{

  # Set the username based on the title if unset.
  if ($username == "UNSET") {
    $username_real = $name
  } else {
    $username_real = $username
  }

  File {
    owner => $username_real,
    group => $username_real,
    mode  => 0640,
  }

  file { "/home/$username_real":
    ensure => directory,
    mode => 0640,
    source => "/var/lib/puppet/skel",
    replace => false,
    recurse => true,
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
    comment => "Managed Account ($username_real)",
    password => '!!',
  }

}
