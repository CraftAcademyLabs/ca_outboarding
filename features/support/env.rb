require 'coveralls'
Coveralls.wear_merged!('rails')

require 'cucumber/rails'
ActionController::Base.allow_rescue = false

require 'elasticsearch/extensions/test/cluster'

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
Cucumber::Rails::Database.javascript_strategy = :truncation

Before do 
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new(OmniAuthFixtures.linkedin_mock)
  OmniAuth.config.mock_auth[:crafted_oauth] = OmniAuth::AuthHash.new(OmniAuthFixtures.crafted_oauth_mock)
  UsersIndex.create! unless UsersIndex.exists?
end

Chromedriver.set_version '2.36' unless ENV['CI'] == 'true'

chrome_options = %w(no-sandbox disable-popup-blocking disable-infobars)
chrome_options << 'headless' if ENV['CI'] == 'true'

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
      args: chrome_options
  )
  Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: options
  )
end

Capybara.server = :puma
Capybara.javascript_driver = :chrome

Before do 
  Warden.test_mode!
  StripeMock.start 
end

Before '@stripe_declined' do 
  StripeMock.prepare_card_error(:card_declined)
end

After do 
  Warden.test_reset!
end

#if !ENV['CHEWY']
  Before do
    binding.pry
    Chewy.strategy(:bypass)
    Elasticsearch::Extensions::Test::Cluster.start(
      port: 9250,
      nodes: 1,
      timeout: 120
    ) unless Elasticsearch::Extensions::Test::Cluster.running?(on: 9250)
  end

  After do
    Elasticsearch::Extensions::Test::Cluster.stop(port: 9250)
  end
#end

After do
  UsersIndex.delete! if UsersIndex.exists?
end

World(FactoryBot::Syntax::Methods)
World(Warden::Test::Helpers)