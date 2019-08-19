class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.decimal :alcoholPerVolume, precision:4, scale:2
      t.integer :flavor

      t.timestamps
    end
  end
end
