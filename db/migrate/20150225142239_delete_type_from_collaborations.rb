class DeleteTypeFromCollaborations < ActiveRecord::Migration
  def change
  	remove_column :collaborations, :type
  end
end
