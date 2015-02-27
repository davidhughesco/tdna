class AddCategoryToCollaborations < ActiveRecord::Migration
  def change
    add_column :collaborations, :category, :string
  end
end
