class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :link
      t.string :image
      t.text :recipe

      t.timestamps null: false
    end
  end
end
