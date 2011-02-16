# This is the base class for account management.
# Setup common resources for all accounts here.

class accounts {

  Group { ensure => present } 

  group { [ "one", "two", "three" ]: ensure => absent }
  
  group {
    "sysadmin":
      gid => 200;
    "developer":
      gid => 201;
    "sudoer":
      gid => 202;
    "sudoer_nopw":
      gid => 203;
  }

  # This will pull from <modulepath>/accounts/files/skel/
  file { "/var/lib/puppet/skel":
    ensure  => directory,
    owner   => root,
    group   => root,
    recurse => true,
    source  => "puppet:///modules/${module_name}/skel",
  }

}
