class Transaction < ApplicationRecord
  belongs_to :lead_entity, optional: true
end
