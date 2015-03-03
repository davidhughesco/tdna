class AddVisitsToCandidate < ActiveRecord::Migration
  def change
  	add_column :candidates, :role_visits, :integer
  	add_column :candidates, :tdna_visits, :integer
  	add_column :candidates, :collaborator_role_visits, :integer
  	add_column :candidates, :collaborator_tdna_visits, :integer
  end
end
