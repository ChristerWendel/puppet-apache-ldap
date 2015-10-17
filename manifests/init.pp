# == Class: apache_ldap
#
# A module to configure ldap authentication for apache
#
# === Parameters
# ["version"]
#   The package version to install
#
# ["realm"]
#   The realm to use
#
# ["locations"]
#   Directories that will require authentication
#
# ["ldapurl"]
#   LDAP search string

class apache_ldap (
  $version = 'present',
  $realm = 'Apache LDAP',
  $locations = [''],
  $ldapurl = 'ldap://localhost/dc=company,dc=com?uid',
  )  {
    include apache

    class{'apache_ldap::install': } ->
    class{'apache_ldap::configure': } ~>
    Service['apache2'] ->
    Class['apache_ldap']
  }
