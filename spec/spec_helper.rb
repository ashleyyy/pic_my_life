require './app_config'

ENV['DATABASE'] = "test"

AppConfig.establish_connection

def table_exists? name
  ActiveRecord::Base.connection.table_exists? name
end

RSpec.configure do |config|

  config.before(:each) do
    DatabaseCleaner.start

    if Rails.env.test? || Rails.env.cucumber?
      FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"])
    end 
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end