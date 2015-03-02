class CreateRoleCandidates < ActiveRecord::Migration
  def change
    create_table :role_candidates do |t|
      t.references :candidate, index: true
      t.string :current_role
      t.string :time_in_role
      t.string :previous_role
      t.string :next_role
      t.text :qualifications
      t.string :previous_role_context
      t.string :current_role_context
      t.string :next_role_context
      t.string :main_aspect_a
      t.string :main_aspect_b
      t.string :main_aspect_c
      t.string :main_aspect_d
      t.string :main_aspect_e
      t.integer :main_aspect_importance_a
      t.integer :main_aspect_importance_b
      t.integer :main_aspect_importance_c
      t.integer :main_aspect_importance_d
      t.integer :main_aspect_importance_e
      t.integer :main_aspect_enjoyment_a
      t.integer :main_aspect_enjoyment_b
      t.integer :main_aspect_enjoyment_c
      t.integer :main_aspect_enjoyment_d
      t.integer :main_aspect_enjoyment_e
      t.text :secondary_aspect
      t.text :unnecessary_aspect
      t.text :short_term_training
      t.text :medium_term_training
      t.text :long_term_training

      t.timestamps
    end
  end
end
