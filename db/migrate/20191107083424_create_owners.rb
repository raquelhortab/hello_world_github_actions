class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.integer :dog_id
      t.string :name

      t.timestamps
    end
  end
end
