class CreateNaturalPeople < ActiveRecord::Migration[8.1]
  def change
    create_table :natural_people do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :docs_s3_folder

      t.timestamps
    end
  end
end
