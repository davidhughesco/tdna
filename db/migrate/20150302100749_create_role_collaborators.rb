class CreateRoleCollaborators < ActiveRecord::Migration
  def change
    create_table :role_collaborators do |t|
      t.references :candidate, index: true
      t.integer :collaborator_id
      t.string :current_role
      t.string :next_role
      t.string :current_role_context
      t.string :next_role_context
      t.string :main_aspect_1
      t.string :main_aspect_2
      t.string :main_aspect_3
      t.string :main_aspect_4
      t.string :main_aspect_5

      t.timestamps
    end
  end
end
