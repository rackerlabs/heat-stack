#
# Cookbook Name:: rackspace_cloudbackup
#
# Copyright 2014, Rackspace, US, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Define the CloudBackupTestHelpers which provides shared helper code for all tests.
module CloudBackupTestHelpers
  # Test data from driveclient-1.16.006544-0.x86_64
  def valid_bootstrap_data
    return {
      'AccountId'    => '817815',
      'AgentId'      => 270433,
      'AgentKey'     => 'dummydummydummydummydummydummydummydummydummydummydummydummydummydummyd=',
      'ApiHostName'  => 'api.drivesrvr.com',
      'IsRegistered' => true,
      'RsaKeyPair'   => 'AReallyLongStringWeDontActuallyUse',
      'Username'     => 'rackops',
      'VolumePasswords' => {}
    }
  end
  module_function :valid_bootstrap_data

  def initial_bootstrap_data
    return {
      'ApiHostName'  => '<api-host>',
      'Username'     => '<cloud-account-username>',
      'Password'     => '<cloud-account-api-key>',
      'AgentKey'     => '<blank-unless-registered>',
      'AccountId'    => '<mosso-id>',
      'Https'        => true, # Interesting that this key isn't in valid data...
      'IsRegistered' => false
    }
  end
  module_function :initial_bootstrap_data

  # This class loosely mimics new_resource
  # new() accepts a hash which it turns into getter and setter methods
  class TestResourceData
    attr_accessor :updated
    attr_writer   :updated

    # http://pullmonkey.com/2008/01/06/convert-a-ruby-hash-into-a-class-object/
    def initialize(hash)
      hash.each do |k, v|
        instance_variable_set("@#{k}", v)                                                         ## create and initialize an instance variable for this key/value pair
        self.class.send(:define_method, k, proc { instance_variable_get("@#{k}") })               ## create the getter that returns the instance variable
        self.class.send(:define_method, "#{k}=", proc { |x| instance_variable_set("@#{k}", x) })  ## create the setter that sets the instance variable
      end
    end

                                    # We're mocking here, and attr_writer doesn't behave the same
    def updated_by_last_action(arg) # rubocop:disable TrivialAccessors
      @updated = arg
    end
  end
end
