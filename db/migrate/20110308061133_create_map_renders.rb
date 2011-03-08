class CreateMapRenders < ActiveRecord::Migration
  def self.up
    create_table :map_renders do |t|
      t.references :map
      t.string :status, :default => 'pending'
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :map_renders
  end
end
