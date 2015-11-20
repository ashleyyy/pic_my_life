require './app_config'

ENV['DATABASE']="test"

AppConfig.establish_connection

def table_exists? name
  ActiveRecord::Base.connection.table_exists? name
end

RSpec.configure do |config|

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end