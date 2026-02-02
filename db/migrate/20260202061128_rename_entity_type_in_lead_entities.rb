class RenameEntityTypeInLeadEntities < ActiveRecord::Migration[8.1]
  def change
    rename_column :lead_entities, :entity_type, :lead_entity_kind
  end
end
