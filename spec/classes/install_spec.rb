require 'spec_helper'

describe 'apache_ldap', :type => :class do
  let(:title) { 'apache_ldap::install' }

  it { should contain_apache__loadmodule('authnz_ldap') }
end
