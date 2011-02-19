# Declare sysadmin account resources.

class account::sysadmins {

  account::login { "jeff":
    uid => 601,
    ssh_key => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAzlnWpbiDfBLJWWh3xEIMo3QJhB+/TucyWtqTB3B3np1LHi7/zJW9L5KwqgCPfcCSPKY4ekW4K5DwZgXufM74+acBJqAIioJby5AVlkYtRMuJItzRYfkClN0Ex/8rCc/y8T+Wa5Q7Kyy73312xxqbeO8nzNkDO2Zx2oxxHVDSeThX5+Tk1lFj3LpsWbuTsImK9KsVPX50M6uNQxSt4ASx0SDe0MDLC5uzbGYtjqkZQYEYguo7O64t81+C3JK3BHDPsL5G5H7g2qwPJ7ola1sV1wDCGE9ago09QZvYpOacPbtbesFhbwKP31eDz2PWGSJ4DCIoLKhmfpEuDpiih649VQ== jeff@puppetlabs.com"
  }
  account::login { "matt":
    uid => 602,
    ssh_key => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAoSzIjnKAlkzmxk8Y32vikLlc8pt0cWi+zDtwCm2cGrxoTDMuDFcia4lqXkVTN4eczsfmH7gnpaJxNWjUdiEp+6p38z5r4W9EATsyPjWkTVDlSbKUX/gRFCEHIbjBGlDEOSEDI6umVEwff+AqAFdmrxzWjbM5WnsH5YbQ/ymq1/cDzfKUU5+RttDrivSBbv4Gszz/1wMGsyAIsT3QbZJur0LjvrY9/nyj1PoJ02V/RSZ2LiYr/vJB7d+7fn1k5EiOZIz8ubGRIYPFXh50931A0MO3mkVFVDQkHLbsANzcLUHtY7X1t6/GhZ8wqy9Q1YgBAp6s6qC0GJtIDstHMsfNZw== matthewrobinson@mattmac.local"
  }

}
