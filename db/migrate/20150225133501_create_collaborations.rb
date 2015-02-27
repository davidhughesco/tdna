class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.integer :candidate_id
      t.integer :collaborator_id

      t.timestamps
    end
  end
end
