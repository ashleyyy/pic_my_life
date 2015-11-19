class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password
      t.string :username
      t.timestamps null: false
    end

    create_table :photos do |t|
      t.integer :user_id
      t.string  :caption
      t.string  :url
      t.integer :votes_count
      t.timestamps null: false
    end

    create_table :votes do |t|
      t.integer :user_id
      t.integer :photo_id
      t.string  :context
      t.timestamps null: false
    end
  end
end