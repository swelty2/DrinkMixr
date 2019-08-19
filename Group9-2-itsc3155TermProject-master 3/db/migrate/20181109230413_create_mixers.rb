class CreateMixers < ActiveRecord::Migration[5.2]
  def change
    create_table :mixers do |t|
      t.string :name

      t.timestamps
    end
  end
end
