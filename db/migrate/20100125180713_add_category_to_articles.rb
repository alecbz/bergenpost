class AddCategoryToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.references :category
    end
  end

  def self.down
    change_table :articles do |t|
      t.remove :category
    end
  end
end
