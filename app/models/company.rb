class Company < ApplicationRecord
  has_many :users

  enum :status, { active: "active", trial: "trial", suspended: "suspended", cancelled: "cancelled" }

  validates :name, presence: true
  validates :status, presence: true
end
