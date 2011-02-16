# The main entry point for the Puppet Master Classify your nodes in this file.
# The default node is special and applies to any node not specifically matched
# by another node ... { } definition.

node default {

  # Declare this node to be of class "motd"
  class { "motd": }

  # And NTP, with servers
  class { "ntp":
    servers => [ "time.apple.com", "0.centos.pool.ntp.org", ]
  }

}

