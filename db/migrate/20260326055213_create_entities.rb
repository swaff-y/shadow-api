class CreateEntities < ActiveRecord::Migration[8.1]
  def change
    create_table :entities do |t|
      t.string :type
      t.string :name
      t.string :status
      t.string :risk_rating
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :abn
      t.string :registration_number
      t.string :trust_type

      t.timestamps
    end
  end
end
