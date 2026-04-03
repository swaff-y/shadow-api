class Transaction < ApplicationRecord
  belongs_to :user
  # STI: type column differentiates StandardTransaction and PropertyTransaction
end
