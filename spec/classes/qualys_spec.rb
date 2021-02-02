# frozen_string_literal: true

require 'spec_helper'

describe 'qualys' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) do # { os_facts }
        {
          os_facts
          qualysfile: {
            UseSudo: '0',
            sudouser: 'root',
            sudocommand: 'sudo',
            log_level:  '3',
            logfiledir: '/var/log/qualys',
            cmdmaxtimeout: '1800',
            processpriority: '0',
            requesttimeout: '600',
            useauditdispatcher: '1',
            cmdstdoutsize: '1024',
            luascripttimeout: '3600',
            activationid: '12345',
            customerid: '6789',
            usergroup: 'root',
          }
        }
      end

      let(:params) do
        {
          activationid: '12345',
          customerid: '6789',
        }
      end

      it { is_expected.to contain_class('qualys') }
    end
  end
end
