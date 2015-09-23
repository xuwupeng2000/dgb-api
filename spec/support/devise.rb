RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include Warden::Test::Helpers

  config.before(:all) do
    Warden.test_mode!
  end

  config.after(:all) do
    Warden.test_reset!
  end
end
