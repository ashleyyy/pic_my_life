require 'rubygems'
require 'bundler/setup'
require 'active_support/all'
require 'pry'
require 'active_record'
require 'factory_girl'
require 'faker'
require 'database_cleaner'

require './app/models/photo'
require './app/models/user'
require './app/models/vote'

require './factories/photos_factory'
require './factories/users_factory'
require './factories/votes_factory'

# Connect to the DB
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => "db/db.sqlite3"
)

def table_exists? name
  ActiveRecord::Base.connection.table_exists? name
end

# Recreate the database
ActiveRecord::Migration.suppress_messages do
  require './db/schema.rb'
end

# spec/support/factory_girl.rb
RSpec.configure do |config|
  # additional factory_girl configuration

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end