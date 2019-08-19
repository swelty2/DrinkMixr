class CreateDrinkLiquors < ActiveRecord::Migration[5.2]
  def change
    create_table :drink_liquors do |t|
      t.belongs_to :drink, foreign_key: true, index: true
      t.belongs_to :liquor, foreign_key: true, index: true
      t.string :unit

      t.timestamps
    end
  end
end
