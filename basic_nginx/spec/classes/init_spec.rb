require 'spec_helper'
describe 'basic_nginx' do
  context 'with default values for all parameters' do
    it { should contain_class('basic_nginx') }
  end
end
