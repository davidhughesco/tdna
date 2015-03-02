class CreateNeedsAnalyses < ActiveRecord::Migration
  def change
    create_table :needs_analyses do |t|
      t.references :candidate, index: true
      t.integer :collaborator_id
      t.integer :activity_id
      t.integer :area_id
      t.integer :order_id
      t.integer :relevance
      t.integer :interest
      t.integer :skill
      t.boolean :current_relevance
      t.boolean :future_relevance

      t.timestamps
    end
  end
end
