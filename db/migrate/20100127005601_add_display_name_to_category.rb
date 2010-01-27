class AddDisplayNameToCategory < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.string :display_name
    end
  end

  def self.down
    change_table :categories do |t|
      t.drop :display_name
    end
  end
end
