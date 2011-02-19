# Base account class

class account {

  Group { ensure => present }

  # Base groups for everyone.
  group { "developer":
    gid => 300,
  }
  group { "sysadmin":
    gid => 301,
  }
  group { "sudoer":
    gid => 200,
  }
  group { "sudoer_nopw":
    gid => 201,
  }
  
  # Manage login account "skeleton"
  file { "/var/lib/puppet/skel":
    ensure  => directory,
    source  => "puppet:///modules/${module_name}/skel",
    recurse => true,
    owner   => root,
    group   => root,
    mode    => 0600,
  }

}
