class AddLeadEntityToTransactions < ActiveRecord::Migration[8.1]
  def change
    add_reference :transactions, :lead_entity, null: true, foreign_key: true
  end
end
