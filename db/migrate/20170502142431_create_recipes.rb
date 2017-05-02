class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :describe
      t.text :ingredients
      t.integer :serving
      t.text :method
      t.integer :main_photo

      t.timestamps
    end
  end
end
