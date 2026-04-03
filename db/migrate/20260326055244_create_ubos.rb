class CreateUbos < ActiveRecord::Migration[8.1]
  def change
    create_table :ubos do |t|
      t.references :entity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
