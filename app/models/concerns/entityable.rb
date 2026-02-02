module Entityable
  extend ActiveSupport::Concern

  included do
    has_many :lead_entities, as: :entity, dependent: :destroy
  end
end
