class CreateSellers < ActiveRecord::Migration[8.1]
  def change
    create_table :sellers do |t|
      t.references :property_transaction, null: false, foreign_key: { to_table: :transactions }
      t.references :partyable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
