class Buyer < ApplicationRecord
  belongs_to :property_transaction
  belongs_to :partyable, polymorphic: true
end
