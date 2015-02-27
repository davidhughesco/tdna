class AddColumnsToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :collaborator_id, :integer
    add_column :candidates, :first_name, :string
    add_column :candidates, :last_name, :string
    add_column :candidates, :organisation_id, :integer
    add_column :candidates, :organisation_name, :string
  end
end
