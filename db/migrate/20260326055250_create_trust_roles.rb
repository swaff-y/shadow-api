class CreateTrustRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :trust_roles do |t|
      t.references :trust, null: false, foreign_key: { to_table: :entities }
      t.references :individual, null: false, foreign_key: { to_table: :entities }
      t.string :role

      t.timestamps
    end
  end
end
