class AddEntityToLeadEntities < ActiveRecord::Migration[8.1]
  def change
    add_reference :lead_entities, :entity, polymorphic: true, null: true
  end
end
