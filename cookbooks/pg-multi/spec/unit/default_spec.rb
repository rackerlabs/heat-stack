# encoding: UTF-8
require 'spec_helper'

describe 'pg-multi::default' do
  before do
    allow(::File).to receive(:symlink?).and_return(false)
  end

  platforms = {
    'ubuntu' => ['12.04', '14.04'],
    'centos' => ['6.5']
  }

  platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::Runner.new(platform: platform, version: version) do |node|
            node.set['postgresql']['password']['postgres'] = 'test123'
            node.set['postgresql']['version'] = '9.3'
          end.converge(described_recipe)
        end

        it 'includes postgresql::server recipe' do
          expect(chef_run).to include_recipe('postgresql::server')
        end
      end
    end
  end
end
