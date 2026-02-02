class NaturalPerson < ApplicationRecord
  include Entityable

  has_one :kyc, dependent: :destroy
  has_one :voi, dependent: :destroy

  validates :first_name, :last_name, presence: true
end
