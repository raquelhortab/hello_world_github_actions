class CreateFavouriteFoods < ActiveRecord::Migration
  def change
    create_table :favourite_foods do |t|
      t.references :dog
      t.string :name

      t.timestamps
    end
    add_index :favourite_foods, :dog_id
  end
end
