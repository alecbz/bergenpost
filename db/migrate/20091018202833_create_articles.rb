class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :body
      # t.datetime :time_posted     removed manually
      t.references :author

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
