class CreateMaps < ActiveRecord::Migration
  def self.up
    create_table :maps do |t|
      t.string :title
      t.string :paper_size, :default => 'a4'
      t.string :orientation, :default => 'portrait'
      t.boolean :include_index, :default => true
      t.float :left, :default => 172.53264420557
      t.float :top, :default => -43.456246845822
      t.float :right, :default => 172.73863785791
      t.float :bottom, :default => -43.605592700636

      t.timestamps
    end
  end

  def self.down
    drop_table :maps
  end
end
