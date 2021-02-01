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
        }
      end
      it { is_expected.to contain_class('qualys') }
    end
  end
end
