class CreateDoses < ActiveRecord::Migration
  def change
    create_table :doses do |t|
      t.string :description
      t.references :Cocktail, index: true, foreign_key: true
      t.references :Ingredient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
