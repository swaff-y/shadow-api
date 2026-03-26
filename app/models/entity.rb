class Entity < ApplicationRecord
  has_one :cdd, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_one :risk_assessment, dependent: :destroy
end
