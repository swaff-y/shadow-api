class CreateVois < ActiveRecord::Migration[8.1]
  def change
    create_table :vois do |t|
      t.references :natural_person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
