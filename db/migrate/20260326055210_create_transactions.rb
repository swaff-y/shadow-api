class CreateTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.string :status
      t.string :partyable_type
      t.integer :partyable_id
      t.string :property_address

      t.timestamps
    end

    add_index :transactions, [ :partyable_type, :partyable_id ]
  end
end
