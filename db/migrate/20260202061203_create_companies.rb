class CreateCompanies < ActiveRecord::Migration[8.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :company_number
      t.string :docs_s3_folder

      t.timestamps
    end
  end
end
