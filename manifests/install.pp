# == Class: apache_ldap::install
#
# Installs apache modules
class apache_ldap::install {
  apache::loadmodule{'authnz_ldap': }
}
