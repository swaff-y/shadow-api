class CreateDirectors < ActiveRecord::Migration[8.1]
  def change
    create_table :directors do |t|
      t.references :ubo, null: false, foreign_key: true
      t.references :individual, null: false, foreign_key: { to_table: :entities }

      t.timestamps
    end
  end
end
