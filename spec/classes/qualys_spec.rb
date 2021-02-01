# frozen_string_literal: true

require 'spec_helper'

describe 'qualys' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) do
        {
          activationid: '12345',
          customerid: '6789',
          qualysfile:UseSudo: '0'
          qualysfile.sudouser: 'root',
          qualysfile::sudocommand: 'sudo',
          qualysfile::log_level:  '3',
          qualysfile::logfiledir: '/var/log/qualys',
          qualysfile::cmdmaxtimeout: '1800',
          qualysfile::processpriority: '0',
          qualysfile::requesttimeout: '600',
          qualysfile::useauditdispatcher: '1',
          qualysfile::cmdstdoutsize: '1024',
          qualysfile::luascripttimeout: '3600',
          qualysfile::activationid: '12345',
          qualysfile::customerid: '6789',
          qualysfile::usergroup: 'root',
        }
      end

      it { is_expected.to contain_class('qualys') }
    end
  end
end
