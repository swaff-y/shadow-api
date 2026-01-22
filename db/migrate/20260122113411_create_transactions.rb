class CreateTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :transactions do |t|
      t.datetime :transaction_date
      t.string :status
      t.decimal :price
      t.string :charge_status

      t.timestamps
    end
  end
end
