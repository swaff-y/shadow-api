class Company < ApplicationRecord
  include Entityable

  has_one :kyb, dependent: :destroy

  validates :name, presence: true
end
