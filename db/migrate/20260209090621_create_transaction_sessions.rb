class CreateTransactionSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :transaction_sessions, id: :uuid do |t|
      t.string :transaction_type, null: false  # 'naturalPerson' or 'legalEntity'
      t.jsonb :data, null: false, default: {}
      t.boolean :used, default: false, null: false
      t.datetime :expires_at, null: false
      t.string :source_app  # optional: track which third party created it

      t.timestamps
    end

    add_index :transaction_sessions, :expires_at
    add_index :transaction_sessions, :used
  end
end
