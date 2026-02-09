class TransactionSession < ApplicationRecord
  # Validations
  validates :transaction_type, presence: true, inclusion: { in: %w[naturalPerson legalEntity] }
  validates :data, presence: true
  validates :expires_at, presence: true

  # Scopes
  scope :active, -> { where(used: false).where("expires_at > ?", Time.current) }
  scope :expired, -> { where("expires_at <= ?", Time.current) }

  # Class method to create session with expiration
  def self.create_session(transaction_type:, data:, expires_in: 5.minutes, source_app: nil)
    create!(
      transaction_type: transaction_type,
      data: data,
      expires_at: Time.current + expires_in,
      source_app: source_app
    )
  end

  # Instance methods
  def valid_for_use?
    !used && expires_at > Time.current
  end

  def consume!
    return nil unless valid_for_use?

    update!(used: true)
    data
  end

  def expired?
    expires_at <= Time.current
  end
end
