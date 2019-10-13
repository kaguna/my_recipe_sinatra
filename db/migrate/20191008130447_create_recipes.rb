class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.references :categories, foreign_key: true

      t.timestamps null: false
    end
  end
end
