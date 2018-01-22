require 'spec_helper'
module RequestHelper
  RSpec.configure do |config|
    config.include Warden::Test::Helpers, :type => :request
    Warden.test_mode!

    config.after(:each) do
      Warden.test_reset!
    end
  end
end