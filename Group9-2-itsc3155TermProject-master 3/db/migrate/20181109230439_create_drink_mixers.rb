class CreateDrinkMixers < ActiveRecord::Migration[5.2]
  def change
    create_table :drink_mixers do |t|
      t.belongs_to :drink, foreign_key: true, index: true
      t.belongs_to :mixer, foreign_key: true, index: true
      t.string :unit

      t.timestamps
    end
  end
end
