require 'spec_helper'

describe 'apache_ldap', :type => :class do
  let(:title) { 'apache_ldap::configure' }

  context 'default parameters' do
    it { should contain_file('/etc/apache2/conf-available/ldap.conf')
      .with_ensure('present')
      .with_owner('www-data')
      .with_group('www-data')
      .with_mode('0644')
      .with_content(/<Location \/>/)
      .with_content(/Require valid-user/)
      .with_content(/AuthType Basic/)
      .with_content(/AuthBasicProvider ldap/)
      .with_content(/AuthName \"Apache LDAP\"/)
      .with_content(/AuthLDAPURL "ldap\:\/\/localhost\/dc=company,dc=com\?uid"/)
      .that_comes_before('Apache::loadconf[ldap]')
    }
  end

  context 'custom parameters' do
    let(:params) do
      {:realm => 'test' }
      {:locations => ['one', 'two', 'three'] }
      {:ldapurl => 'http://localhost/dc=com?uid' }

      it { should contain_file('/etc/apache2/conf-available/ldap.conf')
        .with_ensure('present')
        .with_owner('www-data')
        .with_group('www-data')
        .with_mode('0644')
        .with_content(/<Location \/one>/)
        .with_content(/<Location \/two>/)
        .with_content(/<Location \/three>/)
        .with_content(/Require valid-user/)
        .with_content(/AuthType Basic/)
        .with_content(/AuthBasicProvider ldap/)
        .with_content(/AuthName \"test\"/)
        .with_content(/AuthLDAPURL "ldap\:\/\/localhost\/dc=com\?uid"/)
        .that_comes_before('Apache::loadconf[ldap]')
      }
    end
  end
end
