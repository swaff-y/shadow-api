class Ubo < ApplicationRecord
  belongs_to :entity
  has_many :shareholders, dependent: :destroy
  has_many :directors, dependent: :destroy
end
