class DropDataFiles < ActiveRecord::Migration
  def self.up
    drop_table :data_files
  end

  def self.down
    create_table :data_files do |t|
      t.string :name
      t.string :data
      
      t.timestamps
    end
  end
end
