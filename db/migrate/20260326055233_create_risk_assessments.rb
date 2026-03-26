class CreateRiskAssessments < ActiveRecord::Migration[8.1]
  def change
    create_table :risk_assessments do |t|
      t.references :entity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
