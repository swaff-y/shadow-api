class User < ApplicationRecord
  belongs_to :company
  has_many :transactions

  validates :email, presence: true
end
