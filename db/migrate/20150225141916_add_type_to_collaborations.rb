class AddTypeToCollaborations < ActiveRecord::Migration
  def change
    add_column :collaborations, :type, :string
  end
end
