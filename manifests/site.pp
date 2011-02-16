# Puppet Master Entry point.
# Classify your node here.

node "www.puppetlabs.com" {

}

node default {

  # Classify this node as a member of the motd class
  class { "motd": }

}

