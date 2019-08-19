class AddDescriptionToDrinks < ActiveRecord::Migration[5.2]
  def change
    add_column :drinks, :description, :text
  end
end
