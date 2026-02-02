class LeadEntity < ApplicationRecord
  has_many :transactions, dependent: :destroy
  belongs_to :entity, polymorphic: true, optional: true

  # Validations for allowed values
  ENTITY_TYPES = %w[naturalPerson Company Trust Partnership].freeze
  STATUSES = %w[complete in-progress abandoned started].freeze

  validates :lead_entity_kind, inclusion: { in: ENTITY_TYPES }, allow_nil: true
  validates :status, inclusion: { in: STATUSES }
end
