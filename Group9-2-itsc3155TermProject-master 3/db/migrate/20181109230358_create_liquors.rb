class CreateLiquors < ActiveRecord::Migration[5.2]
  def change
    create_table :liquors do |t|
      t.string :name

      t.timestamps
    end
  end
end
