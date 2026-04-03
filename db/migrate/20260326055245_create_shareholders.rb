class CreateShareholders < ActiveRecord::Migration[8.1]
  def change
    create_table :shareholders do |t|
      t.references :ubo, null: false, foreign_key: true
      t.references :shareholdable, polymorphic: true, null: false
      t.decimal :percentage

      t.timestamps
    end
  end
end
