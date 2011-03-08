class CreateCategoriesMaps < ActiveRecord::Migration
  def self.up
    create_table :categories_maps, :id => false do |t|
      t.references :category
      t.references :map
    end
  end

  def self.down
    drop_table :categories_maps
  end
end
