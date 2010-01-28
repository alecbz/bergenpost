class AddViewsToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.integer :views
    end
  end

  def self.down
    change_table :articles do |t|
      t.drop :views
    end
  end
end
