require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

require 'active_record'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'mini_magick'

require 'factory_girl'
require 'faker'
require 'database_cleaner'

require './app/models/user'
require './app/models/photo'
require './app/models/vote'

require './factories/photos_factory'
require './factories/users_factory'
require './factories/votes_factory'

require './lib/importer'


module AppConfig

  DATABASE = ENV['DATABASE'] || 'development'

  DATABASE_PATH = File.absolute_path("db/#{DATABASE}.sqlite3", File.dirname(__FILE__))

  def self.establish_connection
    puts "Connecting to database '#{DATABASE_PATH}'"
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: DATABASE_PATH
    )
  end

end