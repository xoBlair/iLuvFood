class AddUsersIdToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :users_id, :integer
  end
end
