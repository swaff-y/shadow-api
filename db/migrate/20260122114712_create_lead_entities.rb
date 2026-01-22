class CreateLeadEntities < ActiveRecord::Migration[8.1]
  def change
    create_table :lead_entities do |t|
      t.string :entity_type
      t.string :status

      t.timestamps
    end
  end
end
