class LeadEntity < ApplicationRecord
  has_many :transactions, dependent: :destroy

  # Validations for allowed values
  ENTITY_TYPES = %w[naturalPerson Company Trust Partnership].freeze
  STATUSES = %w[complete in-progress abandoned started].freeze

  validates :entity_type, inclusion: { in: ENTITY_TYPES }
  validates :status, inclusion: { in: STATUSES }
end
