# == Class: apache_ldap::configure
#
# Configures ldap authentication for apache
class apache_ldap::configure {
  $locations = $apache_ldap::locations
  $realm = $apache_ldap::realm

  file { '/etc/apache2/conf-available/ldap.conf':
    ensure  => present,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
    content => template('apache_ldap/ldap.erb'),
  } -> apache::loadconf{'ldap': }
}
