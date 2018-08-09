# Class: basic_nginx
# ===========================
#
# Full description of class basic_nginx here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'basic_nginx':
	#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
node default {
  notify { 'before': }
  -> class { '::nginx': }
  -> notify { 'last': }
}

nginx::resource::server { 'domain.com':
  listen_port => 443,
  ssl => true,
  ssl_cert => 'test_ssl.csr',
  ssl_key => 'new_text_cert.key',
  proxy       => 'http://10.10.10.10',
}
nginx::resource::server { 'domain.com/resource2':
  listen_port => 443,
  ssl => true,
  ssl_cert => 'test_ssl.csr',
  ssl_key => 'new_text_cert.key',
  proxy       => 'http://20.20.20.20',
}

::nginx::resource::server {'*':
  access_log => '$remote_addr - $remote_user [$time_local]',
}
