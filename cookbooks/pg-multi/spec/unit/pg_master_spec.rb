# encoding: UTF-8
require 'spec_helper'

describe 'pg-multi::pg_master' do
  before do
    allow(::File).to receive(:symlink?).and_return(false)
    stub_command("psql -c \"SELECT rolname FROM pg_roles WHERE rolname='repl'\" | grep repl").and_return(false)
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
            node.set['pg-multi']['replication']['user'] = 'repl'
            node.set['pg-multi']['replication']['password'] = 'useagudpasswd'
          end.converge(described_recipe)
        end

        it 'includes pg-multi::default' do
          expect(chef_run).to include_recipe('pg-multi::default')
        end

        it 'execute set-replication-user' do
          expect(chef_run).to run_execute("psql -c \"CREATE USER repl REPLICATION LOGIN ENCRYPTED PASSWORD 'useagudpasswd';\"")
        end
      end
    end
  end
end
