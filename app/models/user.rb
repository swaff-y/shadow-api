class User < ApplicationRecord
  belongs_to :company
  has_many :transactions

  enum :role, { agent: "agent", company_admin: "company_admin", super_admin: "super_admin" }

  validates :email, presence: true
  validates :role, presence: true
end
