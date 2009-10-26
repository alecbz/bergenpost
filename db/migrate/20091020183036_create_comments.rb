class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.datetime :time_posted
      t.references :article

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
