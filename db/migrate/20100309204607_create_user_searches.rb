class CreateUserSearches < ActiveRecord::Migration
  def self.up
    create_table :user_searches do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :user_searches
  end
end
