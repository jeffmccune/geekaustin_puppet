# Puppet Master Entry point.
# Classify your node here.

node "www.puppetlabs.com" {

}

node default {
  notify { "hello world": }
}

